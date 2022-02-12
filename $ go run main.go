const Wallet = (props) => {
	const [myKeystation, setMyKeystation] = React.useState(new Keystation);

	const connectKeystation = React.useCallback(() => {

            let myKeystation = new Keystation();
            
            setMyKeystation(myKeystation);
            
            myKeystation.client = "YOUR_WEB_URL";
            myKeystation.lcd = "https://lcd-cosmos-free.cosmostation.io";
            myKeystation.path = "44/118/0/0/0";

	    let prefix = "cosmos";
	    let popup = keystation1.openWindow("signin", prefix);
	    let popupTick = setInterval(function() {
                if (popup.closed) {
                    clearInterval(popupTick);
                    console.log("window closed!");
                }
	    }, 500);
	}, [])

	window.addEventListener("message", function(e) {
	    if (e.origin != "https://keystation.cosmostation.io") return;
	    console.log(e.data);
	    // e.data.account : User's keychain account. Remember this account!
	} , false);
}
