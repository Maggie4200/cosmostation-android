package wannabit.io.cosmostaion.activities.chains.kava;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.widget.Toolbar;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentPagerAdapter;
import androidx.viewpager.widget.ViewPager;

import java.math.BigDecimal;
import java.util.ArrayList;

import wannabit.io.cosmostaion.R;
import wannabit.io.cosmostaion.activities.PasswordCheckActivity;
import wannabit.io.cosmostaion.base.BaseActivity;
import wannabit.io.cosmostaion.base.BaseChain;
import wannabit.io.cosmostaion.base.BaseConstant;
import wannabit.io.cosmostaion.base.BaseFragment;
import wannabit.io.cosmostaion.fragment.chains.kava.RepayCdpStep0Fragment;
import wannabit.io.cosmostaion.fragment.chains.kava.RepayCdpStep1Fragment;
import wannabit.io.cosmostaion.fragment.chains.kava.RepayCdpStep2Fragment;
import wannabit.io.cosmostaion.fragment.chains.kava.RepayCdpStep3Fragment;
import wannabit.io.cosmostaion.model.type.Coin;
import wannabit.io.cosmostaion.model.type.Fee;
import wannabit.io.cosmostaion.network.res.ResCdpDepositStatus;
import wannabit.io.cosmostaion.network.res.ResCdpOwnerStatus;
import wannabit.io.cosmostaion.network.res.ResKavaCdpParam;
import wannabit.io.cosmostaion.network.res.ResKavaMarketPrice;
import wannabit.io.cosmostaion.task.FetchTask.KavaCdpByDepositorTask;
import wannabit.io.cosmostaion.task.FetchTask.KavaCdpByOwnerTask;
import wannabit.io.cosmostaion.task.FetchTask.KavaMarketPriceTask;
import wannabit.io.cosmostaion.task.TaskListener;
import wannabit.io.cosmostaion.task.TaskResult;
import wannabit.io.cosmostaion.utils.WLog;
import wannabit.io.cosmostaion.utils.WUtil;

import static wannabit.io.cosmostaion.base.BaseConstant.TASK_FETCH_KAVA_CDP_DEPOSIT;
import static wannabit.io.cosmostaion.base.BaseConstant.TASK_FETCH_KAVA_CDP_OWENER;
import static wannabit.io.cosmostaion.base.BaseConstant.TASK_FETCH_KAVA_TOKEN_PRICE;

public class RepayCdpActivity extends BaseActivity implements TaskListener {

    private RelativeLayout              mRootView;
    private Toolbar                     mToolbar;
    private TextView                    mTitle;
    private ImageView                   mIvStep;
    private TextView                    mTvStep;
    private ViewPager                   mViewPager;
    private RepayCdpPageAdapter         mPageAdapter;

    private String                          mCollateralParamType;
    private String                          mMaketId;
    public ResKavaCdpParam.CdpParam mCdpParam;
    public ResKavaMarketPrice.Result        mKavaTokenPrice;
    public ResKavaCdpParam.KavaCollateralParam  mCollateralParam;
    public ResCdpOwnerStatus.MyCDP          mMyOwenCdp;
    private ResCdpDepositStatus             mMyDeposits;

    public Coin                             mPayment = new Coin();
    public String                           mMemo;
    public Fee                              mFee;
    public BigDecimal                       mBeforeLiquidationPrice, mBeforeRiskRate, mAfterLiquidationPrice, mAfterRiskRate, mRemainLoanAmount;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_step);
        mRootView           = findViewById(R.id.root_view);
        mToolbar            = findViewById(R.id.tool_bar);
        mTitle              = findViewById(R.id.toolbar_title);
        mIvStep             = findViewById(R.id.send_step);
        mTvStep             = findViewById(R.id.send_step_msg);
        mViewPager          = findViewById(R.id.view_pager);
        mTitle.setText(getString(R.string.str_repay_cdp_c));

        setSupportActionBar(mToolbar);
        getSupportActionBar().setDisplayShowTitleEnabled(false);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        mIvStep.setImageDrawable(getDrawable(R.drawable.step_4_img_1));
        mTvStep.setText(getString(R.string.str_repay_cdp_step_1));

        mAccount = getBaseDao().onSelectAccount(getBaseDao().getLastUser());
        mBaseChain = BaseChain.getChain(mAccount.baseChain);

        mCollateralParamType = getIntent().getStringExtra("collateralParamType");
        mMaketId = getIntent().getStringExtra("marketId");
        mCdpParam = getBaseDao().mCdpParam;
        mCollateralParam = mCdpParam.getCollateralParamByType(mCollateralParamType);
        if (mCdpParam == null || mCollateralParam == null) {
            WLog.e("ERROR No cdp param data");
            onBackPressed();
            return;
        }

        mPageAdapter = new RepayCdpPageAdapter(getSupportFragmentManager());
        mViewPager.setOffscreenPageLimit(3);
        mViewPager.setAdapter(mPageAdapter);

        mViewPager.addOnPageChangeListener(new ViewPager.OnPageChangeListener() {
            @Override
            public void onPageScrolled(int i, float v, int i1) { }

            @Override
            public void onPageSelected(int i) {
                if(i == 0) {
                    mIvStep.setImageDrawable(getDrawable(R.drawable.step_4_img_1));
                    mTvStep.setText(getString(R.string.str_repay_cdp_step_1));
                } else if (i == 1 ) {
                    mIvStep.setImageDrawable(getDrawable(R.drawable.step_4_img_2));
                    mTvStep.setText(getString(R.string.str_repay_cdp_step_2));
                } else if (i == 2 ) {
                    mIvStep.setImageDrawable(getDrawable(R.drawable.step_4_img_3));
                    mTvStep.setText(getString(R.string.str_repay_cdp_step_3));
                    mPageAdapter.mCurrentFragment.onRefreshTab();
                } else if (i == 3 ) {
                    mIvStep.setImageDrawable(getDrawable(R.drawable.step_4_img_4));
                    mTvStep.setText(getString(R.string.str_repay_cdp_step_4));
                    mPageAdapter.mCurrentFragment.onRefreshTab();
                }
            }

            @Override
            public void onPageScrollStateChanged(int i) { }
        });
        mViewPager.setCurrentItem(0);

        mRootView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                onHideKeyboard();
            }
        });
        onFetchCdpInfo();
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case android.R.id.home:
                onBackPressed();
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }

    @Override
    public void onBackPressed() {
        onHideKeyboard();
        if(mViewPager.getCurrentItem() > 0) {
            mViewPager.setCurrentItem(mViewPager.getCurrentItem() - 1, true);
        } else {
            super.onBackPressed();
        }
    }

    public void onNextStep() {
        if(mViewPager.getCurrentItem() < mViewPager.getChildCount()) {
            onHideKeyboard();
            mViewPager.setCurrentItem(mViewPager.getCurrentItem() + 1, true);
        }
    }

    public void onBeforeStep() {
        if(mViewPager.getCurrentItem() > 0) {
            onHideKeyboard();
            mViewPager.setCurrentItem(mViewPager.getCurrentItem() - 1, true);
        } else {
            onBackPressed();
        }
    }

    public void onStartRepayCdp() {
        Intent intent = new Intent(RepayCdpActivity.this, PasswordCheckActivity.class);
        intent.putExtra(BaseConstant.CONST_PW_PURPOSE, BaseConstant.CONST_PW_TX_REPAY_CDP);
        intent.putExtra("sender", mAccount.address);
        intent.putExtra("payment", mPayment);
        intent.putExtra("cdp_denom", mCollateralParam.denom);
        intent.putExtra("collateralType", mCollateralParam.type);
        intent.putExtra("fee", mFee);
        intent.putExtra("memo", mMemo);
        startActivity(intent);
        overridePendingTransition(R.anim.slide_in_bottom, R.anim.fade_out);

    }

    public BigDecimal getTokenAvailable(String denom) {
        return WUtil.getTokenBalance(getBaseDao().mBalances, denom) == null ? BigDecimal.ZERO : WUtil.getTokenBalance(getBaseDao().mBalances, denom).balance;
    }


    private class RepayCdpPageAdapter extends FragmentPagerAdapter {

        private ArrayList<BaseFragment> mFragments = new ArrayList<>();
        private BaseFragment mCurrentFragment;

        public RepayCdpPageAdapter(FragmentManager fm) {
            super(fm);
            mFragments.clear();
            mFragments.add(RepayCdpStep0Fragment.newInstance(null));
            mFragments.add(RepayCdpStep1Fragment.newInstance(null));
            mFragments.add(RepayCdpStep2Fragment.newInstance(null));
            mFragments.add(RepayCdpStep3Fragment.newInstance(null));
        }

        @Override
        public BaseFragment getItem(int position) {
            return mFragments.get(position);
        }

        @Override
        public int getCount() {
            return mFragments.size();
        }

        @Override
        public void setPrimaryItem(ViewGroup container, int position, Object object) {
            if (getCurrentFragment() != object) {
                mCurrentFragment = ((BaseFragment) object);
            }
            super.setPrimaryItem(container, position, object);
        }

        public BaseFragment getCurrentFragment() {
            return mCurrentFragment;
        }

        public ArrayList<BaseFragment> getFragments() {
            return mFragments;
        }

    }

    private int mTaskCount = 0;
    public void onFetchCdpInfo() {
        onShowWaitDialog();
        if (mBaseChain.equals(BaseChain.KAVA_MAIN) || mBaseChain.equals(BaseChain.KAVA_TEST)) {
            mTaskCount = 2;
            new KavaMarketPriceTask(getBaseApplication(), this, BaseChain.getChain(mAccount.baseChain), mMaketId).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
            new KavaCdpByOwnerTask(getBaseApplication(), this, BaseChain.getChain(mAccount.baseChain), mAccount.address, mCollateralParam).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
        }
    }

    @Override
    public void onTaskResponse(TaskResult result) {
        if(isFinishing()) return;
        mTaskCount--;
        if (result.taskType == TASK_FETCH_KAVA_TOKEN_PRICE) {
            if (result.isSuccess && result.resultData != null) {
                mKavaTokenPrice = (ResKavaMarketPrice.Result)result.resultData;
            }

        } else if (result.taskType == TASK_FETCH_KAVA_CDP_OWENER) {
            if (result.isSuccess && result.resultData != null) {
                mMyOwenCdp = (ResCdpOwnerStatus.MyCDP)result.resultData;
                mTaskCount = mTaskCount + 1;
                new KavaCdpByDepositorTask(getBaseApplication(), this, BaseChain.getChain(mAccount.baseChain), mAccount.address, mCollateralParam).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
            }

        } else if (result.taskType == TASK_FETCH_KAVA_CDP_DEPOSIT) {
            if (result.isSuccess && result.resultData != null) {
                mMyDeposits = (ResCdpDepositStatus)result.resultData;
            }
        }

        if (mTaskCount == 0) {
            onHideWaitDialog();
            if (mCdpParam == null || mKavaTokenPrice == null || mMyOwenCdp == null) {
                WLog.w("ERROR");
                Toast.makeText(getBaseContext(), getString(R.string.str_network_error_title), Toast.LENGTH_SHORT).show();
                onBackPressed();
                return;
            }
            mPageAdapter.mCurrentFragment.onRefreshTab();
        }
    }


}
