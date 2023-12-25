import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/core/utils/methods.dart';
import 'package:movies_app/feuters/auth/data/auth_repo/auth_repo_impl.dart';
import 'package:movies_app/feuters/auth/data/models/user_model.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepoImpl) : super(AuthInitial());
  //تعريف authRepoImpl
  AuthRepoImpl authRepoImpl;
  // انظاء ابجيكت من المستخدم
  UserModel? userModel;
  // متغير لتخزين القيمة الخاصة برابط الصورة
  String? _avatarPath;
  //اعظاء قيمة _avatarPath
  Future<void> setAvatarPath(String? path) async {
    _avatarPath = path;
  }

  //جلب قيمة avatarPath
  String? get getAvatarPath => _avatarPath;

  Future<void> singup({
    required String emailAddress,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    emit(AuthSingupLoading());

    //خزن الصورة في storeg
    // واحلب الامتداد الخاص بها
    String pathUrl = _avatarPath != null
        ? await Methods().uploadFile(_avatarPath) ?? ''
        : '';

//انشاء حساب باستخدام password
    var result = await authRepoImpl.singup(
      emailAddress: emailAddress,
      password: password,
      firstName: firstName,
      lastName: lastName,
      avatar: pathUrl,
    );

    result.fold((failure) => emit(AuthSingupFailure(failure.errMessage)),
        (user) {
      userModel = user;
      emit(AuthSingupSucsess());
    });
    //اعادة تهيئه  بعد الانتهاء من الاستخدام
    _avatarPath = null;
  }

  //تسجيل الدخول
  Future<void> singIn(
      {required String emailAddress, required String password}) async {
    emit(AuthSinginLoading());
    var result = await authRepoImpl.singin(
      emailAddress: emailAddress,
      password: password,
    );
    result.fold(
      (failure) => emit(AuthSinginFailure(failure.errMessage)),
      (user) {
        userModel = user;
        emit(AuthSinginSucsess());
      },
    );
  }

  //تسجيل الخروج
  Future<void> signOut() async {
    var result = await authRepoImpl.signOut();
    result.fold(
      (failure) => emit(AuthsignOutFailure(failure.errMessage)),
      (_) {
        userModel = null;

        emit(AuthsignOutSucsess());
      },
    );
  }
}
