package wannabit.io.cosmostaion.activities.chains.nft;

import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Parcel;
import android.os.Parcelable;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.appcompat.widget.Toolbar;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentPagerAdapter;
import androidx.viewpager.widget.ViewPager;

import com.google.android.material.tabs.TabLayout;
import com.google.protobuf.ByteString;

import java.util.ArrayList;

import irismod.nft.Nft;
import wannabit.io.cosmostaion.R;
import wannabit.io.cosmostaion.base.BaseActivity;
import wannabit.io.cosmostaion.base.BaseChain;
import wannabit.io.cosmostaion.base.BaseFragment;
import wannabit.io.cosmostaion.fragment.chains.nft.ListMyNftFragment;
import wannabit.io.cosmostaion.fragment.chains.nft.ListTopNftFragment;
import wannabit.io.cosmostaion.task.TaskListener;
import wannabit.io.cosmostaion.task.TaskResult;
import wannabit.io.cosmostaion.task.gRpcTask.NFTokenListGrpcTask;
import wannabit.io.cosmostaion.utils.WDp;

import static wannabit.io.cosmostaion.base.BaseChain.CRYPTO_MAIN;
import static wannabit.io.cosmostaion.base.BaseChain.IRIS_MAIN;
import static wannabit.io.cosmostaion.base.BaseConstant.TASK_GRPC_FETCH_NFTOKEN_LIST;

public class NFTListActivity extends BaseActivity implements TaskListener {

    private Toolbar             mToolbar;
    private TextView            mTitle;
    private ViewPager           mLabPager;
    private TabLayout           mLabTapLayer;
    private NFTPageAdapter      mPageAdapter;

    public ArrayList<NFTCollectionId>      mMyNFTs = new ArrayList<>();
    private ByteString  mPageKey;
    public long         mPageTotalCnt;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_nft_list);
        mToolbar        = findViewById(R.id.tool_bar);
        mTitle          = findViewById(R.id.toolbar_title);
        mLabTapLayer    = findViewById(R.id.lab_tab);
        mLabPager       = findViewById(R.id.lab_view_pager);
        mTitle.setText(getString(R.string.str_nft_c));

        setSupportActionBar(mToolbar);
        getSupportActionBar().setDisplayShowTitleEnabled(false);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        mAccount = getBaseDao().onSelectAccount(getBaseDao().getLastUser());
        mBaseChain = BaseChain.getChain(mAccount.baseChain);

        mPageAdapter = new NFTPageAdapter(getSupportFragmentManager());
        mLabPager.setAdapter(mPageAdapter);
        mLabTapLayer.setupWithViewPager(mLabPager);
        mLabTapLayer.setTabRippleColor(null);

        View tab0 = LayoutInflater.from(this).inflate(R.layout.view_tab_myvalidator, null);
        TextView tabItemText0 = tab0.findViewById(R.id.tabItemText);
        tabItemText0.setText(R.string.str_my_nfts);
        tabItemText0.setTextColor(WDp.getTabColor(this, mBaseChain));
        mLabTapLayer.getTabAt(0).setCustomView(tab0);

        View tab1 = LayoutInflater.from(this).inflate(R.layout.view_tab_myvalidator, null);
        TextView tabItemText1 = tab1.findViewById(R.id.tabItemText);
        tabItemText1.setTextColor(WDp.getTabColor(this, mBaseChain));
        tabItemText1.setText(R.string.str_top_nfts);
        mLabTapLayer.getTabAt(1).setCustomView(tab1);

        mLabPager.setOffscreenPageLimit(1);
        mLabPager.setCurrentItem(0, false);

        mLabPager.addOnPageChangeListener(new ViewPager.OnPageChangeListener() {
            @Override
            public void onPageScrolled(int i, float v, int i1) { }
            @Override
            public void onPageScrollStateChanged(int i) { }
            @Override
            public void onPageSelected(int i) {
                mPageAdapter.mFragments.get(i).onRefreshTab();
            }
        });
        onShowWaitDialog();
        onFetchNftListInfo();
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

    public void onFetchNftListInfo() {
        mTaskCount = 1;
        new NFTokenListGrpcTask(getBaseApplication(), this, mBaseChain, mAccount, mPageKey).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
    }

    @Override
    public void onTaskResponse(TaskResult result) {
        if (isFinishing()) return;
        mTaskCount--;
        if (result.taskType == TASK_GRPC_FETCH_NFTOKEN_LIST) {
            if (result.isSuccess && result.resultData != null && result.resultByteData != null) {
                if (mBaseChain.equals(IRIS_MAIN)) {
                    ArrayList<Nft.IDCollection> tempList = (ArrayList<Nft.IDCollection>) result.resultData;
                    if (result.resultData2 != null) {
                        mPageTotalCnt = Long.parseLong(result.resultData2);
                    }
                    mPageKey = result.resultByteData;

                    if (tempList.size() > 0) {
                        for (Nft.IDCollection collection : tempList) {
                            for (String tokenId : collection.getTokenIdsList()) {
                                mMyNFTs.add(new NFTCollectionId(collection.getDenomId(), tokenId));
                            }
                        }
                    }

                } else if (mBaseChain.equals(CRYPTO_MAIN)) {
                    ArrayList<chainmain.nft.v1.Nft.IDCollection> tempList = (ArrayList<chainmain.nft.v1.Nft.IDCollection>) result.resultData;
                    if (result.resultData2 != null) {
                        mPageTotalCnt = Long.parseLong(result.resultData2);
                    }
                    mPageKey = result.resultByteData;

                    if (tempList.size() > 0) {
                        for (chainmain.nft.v1.Nft.IDCollection collection : tempList) {
                            for (String tokenId : collection.getTokenIdsList()) {
                                mMyNFTs.add(new NFTCollectionId(collection.getDenomId(), tokenId));
                            }
                        }
                    }
                }
            }

        }

        if (mTaskCount == 0) {
            new Handler(Looper.getMainLooper()).postDelayed(new Runnable() {
                @Override
                public void run() {
                    onHideWaitDialog();
                    mPageAdapter.mCurrentFragment.onRefreshTab();
                }
            }, 300);
        }
    }

    private class NFTPageAdapter extends FragmentPagerAdapter {
        private ArrayList<BaseFragment> mFragments = new ArrayList<>();
        private BaseFragment mCurrentFragment;

        public NFTPageAdapter(FragmentManager fm) {
            super(fm);
            mFragments.clear();
            mFragments.add(ListMyNftFragment.newInstance(null));
            mFragments.add(ListTopNftFragment.newInstance(null));
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

    public static class NFTCollectionId implements Parcelable {
        public String denom_id;
        public String token_id;

        public NFTCollectionId(String denom_id, String token_id) {
            this.denom_id = denom_id;
            this.token_id = token_id;
        }

        protected NFTCollectionId(Parcel in) {
            denom_id = in.readString();
            token_id = in.readString();
        }

        public static final Creator<NFTCollectionId> CREATOR = new Creator<NFTCollectionId>() {
            @Override
            public NFTCollectionId createFromParcel(Parcel in) {
                return new NFTCollectionId(in);
            }

            @Override
            public NFTCollectionId[] newArray(int size) {
                return new NFTCollectionId[size];
            }
        };

        @Override
        public int describeContents() {
            return 0;
        }

        @Override
        public void writeToParcel(Parcel dest, int flags) {
            dest.writeString(denom_id);
            dest.writeString(token_id);
        }
    }

}
