import 'package:bookmystall/app/data/Request/ApiRequest.dart';
import 'package:bookmystall/app/modules/home/model/events_api_model.dart';

class EventProvider {
  //http://bookmystall.in/dev/public/api/Event/GetEventsByCity/Hyderabad

  void requestEvent({
    required String cityName,
    required String token,
    Function()? beforeSend,
    Function(EventsModel otpModel)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    ApiRequest(
      url:
          'http://bookmystall.in/dev/public/api/Event/GetEventsByCity/$cityName',
      token: token,
      body: null,
      data: null,
    ).get(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        if (onSuccess != null) onSuccess(EventsModel.fromJson(data));
      },
      onError: (error) => {
        if (onError != null) onError(onError),
      },
    );
  }
}
