import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebPage extends StatefulWidget {
  PaymentWebPage({Key key, this.link}) : super(key: key);
  String link;

  @override
  _PaymentWebPageState createState() => _PaymentWebPageState();
}

class _PaymentWebPageState extends State<PaymentWebPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl:
                'https://kpaytest.com.kw/kpg/PaymentHTTP.htm?param=paymentInit&trandata=6463A5E7E55F698D7CFC0E49BC8E2FA5DC25F60F12D1F35FD72D3CEB496972F487F30A11B1DAF35A21EDBADAF2D50884306E02133AF930A81006AD2053F4C504FF1963A2EB03621EF98EEC6FD69590988D2865F9B25D4655D08FFB4B77EC8C0EA525BF0889BB75B04378015C12501ED4118D0AFEE2CDBA479BA36CBCE8B736B706A556D1277466BB950BEA2206F87EB3E1E7A0E0E45099EC77DF599DCC1B96A98B6B5B10BA51C082AAB2B223C98A1B1AE1D425FAD1012BEEB1138669345FB94C7AAD10348BADA4B1AB220328620A3BD73A9CD54D92D9B70C5406BAD6474E2A0DFA3A97DFA3188D98AEE902367A65E3302236807A208A5D716E36DC9D30FC66E98FD360F59C48153B7E60242A78683D825D8302399958CF12153DB256EE8D82C3C36C8952B6A305CC70E97D747CDF20EE&errorURL=https://schbackend.azurewebsites.net/Controllers/PaymentUrl.html&tranportalId=128701',
          ),
        ),
      ),
    );
  }
}
