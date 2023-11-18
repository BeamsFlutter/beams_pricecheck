
import 'package:beams_pricecheck/controller/Services/appExceptions.dart';

mixin BaseController   {
  void handleError(error) {
    if (error is BadRequestException) {
      var message = error.message;
      //Fluttertoast.showToast(msg: message.toString());

    } else if (error is FetchDataException) {
      var message = error.message;
     //Fluttertoast.showToast(msg: message.toString());


    } else if (error is ApiNotRespondingException) {
      var message = error.message;
     // Fluttertoast.showToast(msg: message.toString());

    } else if (error is ServerError) {
      var message = error.message;
      //Fluttertoast.showToast(msg: 'BE500');
      //ServerOffline();
    }
  }
}