import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:seniorgy_app_project/login/views/onboarding_area.dart';
import 'dart:io';
import '../../const/color.dart';

class OnBoardingProfile extends StatefulWidget {
  const OnBoardingProfile({Key? key}) : super(key: key);

  @override
  State<OnBoardingProfile> createState() => _OnBoardingProfileState();
}

class _OnBoardingProfileState extends State<OnBoardingProfile> {

  final user = FirebaseAuth.instance.currentUser;

  final titleTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontWeight: FontWeight.w700,
      fontFamily: 'PyeongChangPeace');

  final subTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w300,
      fontFamily: 'PyeongChangPeace');

  final buttonTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontFamily: 'Pretendard');

  final _textEditingController = TextEditingController();

  File? _selectedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<String?> uploadImageToFirebase(String uid) async {
    if (_selectedImage == null) {
      return null;
    }

    String imageName = "Profile";
    Reference storageReference = storage.ref().child('users/$uid/images/$imageName');
    UploadTask uploadTask = storageReference.putFile(_selectedImage!);

    TaskSnapshot taskSnapshot = await uploadTask;
    String imageUrl = await taskSnapshot.ref.getDownloadURL();

    print("이미지 업로드 완료");
    return imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBlueColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            'assets/images/Const/Back_White.png',
            width: 31,
            height: 31,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: mainBlueColor,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 23, top: 20.0),
            child: Text("2/5",
                style: subTextStyle.copyWith(color: const Color(0x56FFFFFF))),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, top: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '당신의 프로필 사진을\n설정해주시겠어요?',
                style: subTextStyle.copyWith(fontSize: 30.0),
              ),
              const SizedBox(height: 32.0),
              SizedBox(
                height: 116,
                child: Image.asset(
                  "assets/images/Login/Pinky.png",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 26.0),
              SizedBox(
                height: 292,
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 292,
                            child: Image.asset(
                              "assets/images/Login/OnboardingCamera.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 74,
                      top: 123,
                      child: GestureDetector(
                        onTap: () {
                          _pickImage();
                        },
                        child: _selectedImage == null ? SizedBox(
                          width: 71.0,
                          height: 71.0,
                          child: SizedBox(
                            height: 40.0,
                            width: 40.0,
                            child: Image.asset(
                              "assets/images/Login/PlusCam.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ) : Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: mainOrangeColor,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(200.0),
                          ),
                          width: 71.0,
                          height: 71.0,
                          child: ClipOval(
                            child: Image.file(_selectedImage!,
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 72.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary:
                _selectedImage == null ? const Color(0xFFDBDBDC) : Colors.black,
            onPrimary: Colors.white,
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0)),
          ),
          onPressed: () {
            uploadImageToFirebase(user?.uid ?? "");
            if (_selectedImage != null) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return const OnBoardingArea();
              }));
            }
          },
          child: Text(
            '다음',
            style: buttonTextStyle,
          ),
        ),
      ),
    );
  }
}
