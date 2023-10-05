import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:learning_app_1/data/datasource/banner/banner_remote_datasource.dart';
import 'package:learning_app_1/data/datasource/course/course_remote_datasource.dart';
import 'package:learning_app_1/data/model/banner/banner_response_model.dart';
// import 'package:learning_app_1/data/model/course/course_response_model.dart';
import 'package:learning_app_1/presentation/blocs/course/course_cubit.dart';
import 'package:learning_app_1/presentation/state/view_state.dart';

class SubjectModel {
  final String subjectName;
  final int exercise;
  final int exerciseDone;

  const SubjectModel({
    required this.exercise,
    required this.exerciseDone,
    required this.subjectName,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //banner
  BannerResponseModel bannerResponse = BannerResponseModel();
  BannerRemoteDatasource bannerRemoteDatasource = BannerRemoteDatasource();
  ViewState bannerState = ViewState.initial;

  // get data Banner
  void getBanners() async {
    bannerState = ViewState.loading;
    setState(() {});

    final result = await bannerRemoteDatasource.getBanners();

    bannerState = ViewState.success;
    bannerResponse = result;

    setState(() {});
  }

  @override
  void initState() {
    getBanners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CourseCubit>(
      create: (context) =>
          CourseCubit(remoteDatasource: CourseRemoteDatasource()),
      child: Scaffold(
        backgroundColor: const Color(0xFFF3F7F8),
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, Altop',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'Selamat Datang',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                foregroundImage: AssetImage(
                  'assets/Icons/edo-selfie.png',
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(28),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: HexColor('#3A7FD5'),
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 28, top: 32),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Mau kerjain soal apa hari ini?',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                          'assets/Image/ilust_3.png',
                          width: 150,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Pilih Pelajaran',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Lihat Semua',
                        style: TextStyle(color: Colors.lightBlue),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<CourseCubit, CourseState>(
                  builder: (context, state) {
                    if (state is CourseSuccess) {
                      return ListView.separated(
                        shrinkWrap: true,
                        itemCount: 3,
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 12,
                        ),
                        itemBuilder: (context, index) {
                          final course = state.courseResponse.data?[index];
                          return Container(
                            // physics: const NeverScrollableScrollPhysics(),
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xFFF3F7F8),
                                    ),
                                    child: Image.network(
                                      course?.urlCover ?? '',
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              const SizedBox.shrink(),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(course?.majorName ?? ''),
                                        Text(
                                            '${course?.jumlahDone ?? 0}/${course?.jumlahMateri ?? 0} Materi Selesai'),
                                        // LinearProgressIndicator(
                                        //   value: (course?.jumlahDone ?? 0) /
                                        //       (course?.jumlahMateri ?? 0),
                                        // ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else if (state is CourseError) {
                      return Center(
                        child: Text(state.message ?? ''),
                      );
                    }

                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
                // : const Center(
                //     child: CircularProgressIndicator(),
                //   ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Terbaru',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 170,
                  child: bannerState == ViewState.success
                      ? ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 8,
                          ),
                          itemCount: bannerResponse.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            final banner = bannerResponse.data?[index];
                            return Image.network(
                              banner?.eventImage ?? '',
                              width: 350,
                              fit: BoxFit.cover,
                            );
                          },
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
