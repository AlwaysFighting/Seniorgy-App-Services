import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../const/color.dart';
import '../../../const/custom_black_back.dart';
import 'create_room_setting.dart';

class UploadPictureRooms extends StatefulWidget {
  const UploadPictureRooms({Key? key}) : super(key: key);

  @override
  State<UploadPictureRooms> createState() => _UploadPictureRoomsState();
}

class _UploadPictureRoomsState extends State<UploadPictureRooms> {

  final titleTextStyle = const TextStyle(
      color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600);

  final subTextStyle = const TextStyle(
      color: grey2TextColor, fontSize: 14, fontWeight: FontWeight.w400);

  bool _isNextButtonEnabled = true;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const CustomBackBButton(),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20.0, right: 20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Row(
                          children: List.generate(
                            6,
                                (index) => Padding(
                              padding: const EdgeInsets.only(right: 2),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 8,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: index == 0 || index == 1 || index == 2 || index == 3
                                      ? mainColor
                                      : const Color(0xFFF4F4F4),
                                  borderRadius: BorderRadius.only(
                                    topLeft:
                                    Radius.circular(index == 0 ? 8 : 0),
                                    bottomLeft:
                                    Radius.circular(index == 0 ? 8 : 0),
                                    topRight:
                                    Radius.circular(index == 5 ? 8 : 0),
                                    bottomRight:
                                    Radius.circular(index == 5 ? 8 : 0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Row(
                          children: [
                            Text(
                              "4/",
                              style: titleTextStyle.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 12.0,
                              ),
                            ),
                            Text(
                              "6",
                              style: titleTextStyle.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 28.0),
                  Text("방을 소개하는 사진을 올려주세요", style: titleTextStyle),
                  const SizedBox(height: 110.0),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        _pickImage();
                      },
                      child: _selectedImage != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(200.0),
                              // 원하는 둥근 정도 설정
                              child: SizedBox(
                                width: 200.0, // 원하는 너비 설정
                                height: 200.0, // 원하는 높이 설정
                                child: Image.file(_selectedImage!,
                                    fit: BoxFit.cover),
                              ),
                            )
                          : Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFFE8EBEF),
                                  width: 1,
                                ),
                                color: const Color(0xFFF4F6F8),
                                borderRadius: BorderRadius.circular(200.0),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  size: 50,
                                  color: Color(0xFFA6ADBB),
                                ),
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 205.0),
                  SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                      autofocus: false,
                      onPressed: () {
                        if(_isNextButtonEnabled == true) {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (BuildContext context) {
                                return const SettingRooms();
                              }));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        // 메인 컬러
                        backgroundColor: _isNextButtonEnabled ? mainColor : buttonDisabledColor,
                        // 버튼 안 텍스트 스타일
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                        minimumSize: const Size(double.infinity, 358),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0), // 모서리 둥글기 정도
                        ),
                        elevation: 0,
                      ),
                      child: const Text('다음'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
