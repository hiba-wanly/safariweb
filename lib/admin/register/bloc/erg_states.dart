import 'dart:io';

abstract class RegisterState{}

class initialState extends RegisterState{}

class ImageLoaded extends RegisterState{
  final File ProfileImage;
  ImageLoaded(this.ProfileImage);

}
class SuccessState extends RegisterState{}

class ErrorState extends RegisterState{
  final String message;
  ErrorState({required this.message});
}

class LoadingState extends RegisterState{}