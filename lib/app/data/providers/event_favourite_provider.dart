import 'package:bookmystall/app/modules/home/model/favourite_model.dart';

import '../Request/ApiRequest.dart';

class EventFavouriteProvider {
  //http://bookmystall.in/dev/public/api/Event/markAsFavourite

  void favourite({
    required FavouriteModel favouriteModel,
    Function()? beforeSend,
    required String token,
    Function(FavouriteResponseModel favouriteResponseModel)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    ApiRequest(
            url: 'http://bookmystall.in/dev/public/api/Event/markAsFavourite',
            body: favouriteModel.toJson(),
            data: null,
            token: token)
        .post(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        if (onSuccess != null) onSuccess(FavouriteResponseModel.fromJson(data));
      },
      onError: (error) => {
        if (onError != null) onError(onError),
      },
    );
  }
}
