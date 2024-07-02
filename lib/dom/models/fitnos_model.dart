// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive_flutter/hive_flutter.dart';

part 'fitnos_model.g.dart';

@HiveType(typeId: 1)
class FitnosModel {
  @HiveField(0)
  final String fitnosImage;
  @HiveField(1)
  final String fitnosCal;
  @HiveField(2)
  final String fitnosName;
  @HiveField(3)
  final List<FitnosExModel> fitnosExList;
  @HiveField(4)
  final String fitnosKey;
  FitnosModel({
    required this.fitnosKey,
    required this.fitnosImage,
    required this.fitnosCal,
    required this.fitnosName,
    required this.fitnosExList,
  });
}

@HiveType(typeId: 2)
class FitnosExModel {
  @HiveField(0)
  final String fitnoExsImage;
  @HiveField(1)
  final String fitnosExName;
  @HiveField(2)
  final String fitnosExDesc;
  @HiveField(3)
  final int fitnosExSec;
  @HiveField(4)
  final String fitnosExTag;
  @HiveField(5)
  final bool fitnosExComplete;
  FitnosExModel(
      {required this.fitnoExsImage,
      required this.fitnosExName,
      required this.fitnosExDesc,
      required this.fitnosExSec,
      required this.fitnosExTag,
      required this.fitnosExComplete});

  FitnosExModel copyWith(
      {String? fitnoExsImage,
      String? fitnosExName,
      String? fitnosExDesc,
      int? fitnosExSec,
      String? fitnosExTag,
      bool? fitnosExComplete}) {
    return FitnosExModel(
        fitnoExsImage: fitnoExsImage ?? this.fitnoExsImage,
        fitnosExName: fitnosExName ?? this.fitnosExName,
        fitnosExDesc: fitnosExDesc ?? this.fitnosExDesc,
        fitnosExSec: fitnosExSec ?? this.fitnosExSec,
        fitnosExTag: fitnosExTag ?? this.fitnosExTag,
        fitnosExComplete: fitnosExComplete ?? this.fitnosExComplete);
  }
}

final List<FitnosModel> dayPlan = [
  FitnosModel(
    fitnosKey: '1',
    fitnosImage:
        'https://i.ibb.co/r3swJrq/32c58704fad2c1b79204beafb6ce1c3a.jpg',
    fitnosCal: '200',
    fitnosName: 'Morning Routine',
    fitnosExList: [
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/YNGVmjk/750048f5e46a99c9541780a74c227ac8.png',
        fitnosExName: 'Run',
        fitnosExDesc:
            'Find a comfortable place to run.Start with a light warm-up.Run at a moderate pace, gradually increasing your speed.Monitor your breathing and well-being.Cool down after your workout.',
        fitnosExSec: 120,
        fitnosExTag: 'Warm-up ',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/QNcjhpQ/665ecbd92ef10611be268960541e1563.jpg',
        fitnosExName: 'Pull-ups',
        fitnosExDesc:
            'Find a stable crossbar. Grab it with an overhand grip, hands shoulder-width apart. Pull yourself up, contracting the muscles of your back and arms, until your chin is above the bar. Avoid jerking and swinging.',
        fitnosExSec: 30,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/M9Xm5Lr/fd7e572da685bccf93b18291d3bee895.jpg',
        fitnosExName: 'Squats',
        fitnosExDesc:
            'Stand up straight with your feet shoulder-width apart.Bend your knees as if you are sitting on a chair.Make sure your knees do not go beyond your toes.Lower yourself down until your thighs are parallel to the floor.Return to the starting position.',
        fitnosExSec: 30,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/56DzgFd/36f812a69cb087538a6064c0e1891838.png',
        fitnosExName: 'Pull-ups',
        fitnosExDesc:
            'Strengthen your upper body with this classic exercise. Lower your chest towards the floor, keeping your elbows close to your body, while maintaining a straight line from head to heels. Push back up to the starting position',
        fitnosExSec: 60,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/MpM6zft/4267c05712878d423ed315670421188f.png',
        fitnosExName: 'Stretching',
        fitnosExDesc:
            'Gently lengthen muscles, enhance joint mobility, and reduce injury risk by incorporating regular stretching into your routine. Hold each stretch for 10-30 seconds, gradually increasing the intensity as you progress.',
        fitnosExSec: 120,
        fitnosExTag: 'Hitch ',
        fitnosExComplete: false,
      ),
    ],
  ),
  FitnosModel(
    fitnosKey: '2',
    fitnosImage:
        'https://i.ibb.co/2YWcxMs/b216c1dcbb04fce7f2bc3718bd15001b.jpg',
    fitnosCal: '200',
    fitnosName: 'Evening Routine',
    fitnosExList: [
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/YNGVmjk/750048f5e46a99c9541780a74c227ac8.png',
        fitnosExName: 'Run',
        fitnosExDesc:
            'Find a comfortable place to run.Start with a light warm-up.Run at a moderate pace, gradually increasing your speed.Monitor your breathing and well-being.Cool down after your workout.',
        fitnosExSec: 120,
        fitnosExTag: 'Warm-up ',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/QNcjhpQ/665ecbd92ef10611be268960541e1563.jpg',
        fitnosExName: 'Pull-ups',
        fitnosExDesc:
            'Find a stable crossbar. Grab it with an overhand grip, hands shoulder-width apart. Pull yourself up, contracting the muscles of your back and arms, until your chin is above the bar. Avoid jerking and swinging.',
        fitnosExSec: 30,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/M9Xm5Lr/fd7e572da685bccf93b18291d3bee895.jpg',
        fitnosExName: 'Squats',
        fitnosExDesc:
            'Stand up straight with your feet shoulder-width apart.Bend your knees as if you are sitting on a chair.Make sure your knees do not go beyond your toes.Lower yourself down until your thighs are parallel to the floor.Return to the starting position.',
        fitnosExSec: 30,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/56DzgFd/36f812a69cb087538a6064c0e1891838.png',
        fitnosExName: 'Pull-ups',
        fitnosExDesc:
            'Strengthen your upper body with this classic exercise. Lower your chest towards the floor, keeping your elbows close to your body, while maintaining a straight line from head to heels. Push back up to the starting position',
        fitnosExSec: 60,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/MpM6zft/4267c05712878d423ed315670421188f.png',
        fitnosExName: 'Stretching',
        fitnosExDesc:
            'Gently lengthen muscles, enhance joint mobility, and reduce injury risk by incorporating regular stretching into your routine. Hold each stretch for 10-30 seconds, gradually increasing the intensity as you progress.',
        fitnosExSec: 120,
        fitnosExTag: 'Hitch ',
        fitnosExComplete: false,
      ),
    ],
  ),
];

final List<FitnosModel> partList = [
  FitnosModel(
    fitnosKey: '3',
    fitnosImage:
        'https://i.ibb.co/jDWB6Pq/782b4c5c4fa4eb0c8595d0e85bee22a7.jpg',
    fitnosCal: '300',
    fitnosName: 'Сhest',
    fitnosExList: [
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/ZfrZqV9/35e602be7e7ea7b2a93328f459eb90b1.png',
        fitnosExName: 'Dumbbell Press',
        fitnosExDesc:
            ' Lie on a horizontal bench, lower the dumbbells to your chest, then press them up forcefully, focusing on a smooth movement.',
        fitnosExSec: 120,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/V2ZM7nQ/030dba9929e55a068300a4ca799356ce.jpg',
        fitnosExName: 'Barbell Press',
        fitnosExDesc:
            'Take a grip slightly wider than shoulder-width, lower the bar to your chest, then press it up, fully extending your arms.',
        fitnosExSec: 120,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/56DzgFd/36f812a69cb087538a6064c0e1891838.png',
        fitnosExName: 'Pull-ups',
        fitnosExDesc:
            'Strengthen your upper body with this classic exercise. Lower your chest towards the floor, keeping your elbows close to your body, while maintaining a straight line from head to heels. Push back up to the starting position',
        fitnosExSec: 60,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
    ],
  ),
  FitnosModel(
    fitnosKey: '4',
    fitnosImage:
        'https://i.ibb.co/GW0VT0x/44b85c16a476aa3e0a7bd3f9b8135c12.png',
    fitnosCal: '300',
    fitnosName: 'Abs',
    fitnosExList: [
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/brNkDgt/e94eb553a24c27142a2d63bd734bf71a.jpg',
        fitnosExName: 'Crunches',
        fitnosExDesc:
            'Lie on your back with knees bent and feet on the floor. Lift your upper body using your abs, keeping your pelvis on the floor. Hold briefly at the top, then slowly lower back down.',
        fitnosExSec: 120,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/r347t0W/c22918fc9cf8435284282dd08d06342c.jpg',
        fitnosExName: 'Leg Raises',
        fitnosExDesc:
            'Lie on your back with straight legs. Lift your legs until perpendicular, then lower them without touching the floor. Keep your lower back pressed to the floor.',
        fitnosExSec: 120,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/fCMQfQh/9bcd31c32da31063d65e6d5365847ce2.jpg',
        fitnosExName: 'Bicycle',
        fitnosExDesc:
            'Lie on your back and simulate cycling movements with your legs. Touch your opposite elbow to your knee as you twist your torso. Ensure your lower back stays pressed to the floor.',
        fitnosExSec: 120,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
    ],
  ),
  FitnosModel(
    fitnosKey: '5',
    fitnosImage:
        'https://i.ibb.co/x6gLD3z/219c74b8c576ae8b1f3a97a258104f4c.png',
    fitnosCal: '250',
    fitnosName: 'Biceps',
    fitnosExList: [
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/XD6Pvmf/661314728fc0ef8b98be761206057144.jpg',
        fitnosExName: 'Dumbbell',
        fitnosExDesc:
            'Stand straight, holding a dumbbell in each hand with palms facing forward. Bend your elbows, lifting the dumbbells to your shoulders. Slowly lower them back to the starting position, controlling the movement.',
        fitnosExSec: 120,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/xf8MbJ7/f0df7b312b554b5fbda88bb8cdbbe4ee.jpg',
        fitnosExName: 'Barbell Curls',
        fitnosExDesc:
            'Stand straight, holding a barbell with an underhand grip, shoulder-width apart. Bend your elbows, lifting the barbell to your chest. Slowly lower the barbell back to the starting position.',
        fitnosExSec: 120,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/Lzwvwdz/3d953417d72d5845df1547c67b046cb0.jpg',
        fitnosExName: 'Hammer Curls',
        fitnosExDesc:
            'Stand straight, holding a dumbbell in each hand with palms facing inward. Bend your elbows, lifting the dumbbells to your shoulders, keeping your palms facing each other. ',
        fitnosExSec: 120,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
    ],
  ),
  FitnosModel(
    fitnosKey: '6',
    fitnosImage:
        'https://i.ibb.co/xXN0J7k/97f81408a921d9b742ee8e11fab09ce1.jpg',
    fitnosCal: '350',
    fitnosName: 'Back',
    fitnosExList: [
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/HCTHs4K/c2af73f43f8fd89215dbcad400d1ab1e.jpg',
        fitnosExName: 'Bent Over Barbell Row',
        fitnosExDesc: '',
        fitnosExSec: 120,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/vhxcvwP/985b3e9966dde1e8e4e319bddaaac7ef.jpg',
        fitnosExName: 'One-Arm Dumbbell Rows',
        fitnosExDesc:
            'Stand with one foot on a bench and hold the bench with one hand for support. Hold a dumbbell in the other hand. Pull the dumbbell towards your side, bending your elbow and squeezing your shoulder blades. ',
        fitnosExSec: 120,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/xhY1LLW/57eb1768b9e76824d1faf36a2d7342fe.jpg',
        fitnosExName: 'Lat Pulldowns',
        fitnosExDesc:
            'Sit at a lat pulldown machine and grab the bar with a wide grip. Pull the bar down to your chest, squeezing your shoulder blades together. Slowly return the bar to the starting position, fully extending your arms.',
        fitnosExSec: 120,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
    ],
  ),
];

final List<FitnosModel> recoPlan = [
  FitnosModel(
    fitnosKey: '7',
    fitnosImage:
        'https://i.ibb.co/QK4LJpg/098d644c89168118e7a3d4e3ccf04f33.png',
    fitnosCal: '400',
    fitnosName: 'Apollo training',
    fitnosExList: [
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/YNGVmjk/750048f5e46a99c9541780a74c227ac8.png',
        fitnosExName: 'Run',
        fitnosExDesc:
            'Find a comfortable place to run.Start with a light warm-up.Run at a moderate pace, gradually increasing your speed.Monitor your breathing and well-being.Cool down after your workout.',
        fitnosExSec: 120,
        fitnosExTag: 'Warm-up ',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/ZfrZqV9/35e602be7e7ea7b2a93328f459eb90b1.png',
        fitnosExName: 'Dumbbell Press',
        fitnosExDesc:
            ' Lie on a horizontal bench, lower the dumbbells to your chest, then press them up forcefully, focusing on a smooth movement.',
        fitnosExSec: 120,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/xhY1LLW/57eb1768b9e76824d1faf36a2d7342fe.jpg',
        fitnosExName: 'Lat Pulldowns',
        fitnosExDesc:
            'Sit at a lat pulldown machine and grab the bar with a wide grip. Pull the bar down to your chest, squeezing your shoulder blades together. Slowly return the bar to the starting position, fully extending your arms.',
        fitnosExSec: 120,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/brNkDgt/e94eb553a24c27142a2d63bd734bf71a.jpg',
        fitnosExName: 'Crunches',
        fitnosExDesc:
            'Lie on your back with knees bent and feet on the floor. Lift your upper body using your abs, keeping your pelvis on the floor. Hold briefly at the top, then slowly lower back down.',
        fitnosExSec: 120,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/56DzgFd/36f812a69cb087538a6064c0e1891838.png',
        fitnosExName: 'Pull-ups',
        fitnosExDesc:
            'Strengthen your upper body with this classic exercise. Lower your chest towards the floor, keeping your elbows close to your body, while maintaining a straight line from head to heels. Push back up to the starting position',
        fitnosExSec: 60,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
    ],
  ),
  FitnosModel(
    fitnosKey: '8',
    fitnosImage:
        'https://i.ibb.co/YP2YMRD/8b1f8e3d340e9628f5907d1d49b43a15.png',
    fitnosCal: '500',
    fitnosName: 'Zeus training',
    fitnosExList: [
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/YNGVmjk/750048f5e46a99c9541780a74c227ac8.png',
        fitnosExName: 'Run',
        fitnosExDesc:
            'Find a comfortable place to run.Start with a light warm-up.Run at a moderate pace, gradually increasing your speed.Monitor your breathing and well-being.Cool down after your workout.',
        fitnosExSec: 120,
        fitnosExTag: 'Warm-up ',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/V2ZM7nQ/030dba9929e55a068300a4ca799356ce.jpg',
        fitnosExName: 'Barbell Press',
        fitnosExDesc:
            'Take a grip slightly wider than shoulder-width, lower the bar to your chest, then press it up, fully extending your arms.',
        fitnosExSec: 120,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/vhxcvwP/985b3e9966dde1e8e4e319bddaaac7ef.jpg',
        fitnosExName: 'One-Arm Dumbbell Rows',
        fitnosExDesc:
            'Stand with one foot on a bench and hold the bench with one hand for support. Hold a dumbbell in the other hand. Pull the dumbbell towards your side, bending your elbow and squeezing your shoulder blades. ',
        fitnosExSec: 120,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/r347t0W/c22918fc9cf8435284282dd08d06342c.jpg',
        fitnosExName: 'Leg Raises',
        fitnosExDesc:
            'Lie on your back with straight legs. Lift your legs until perpendicular, then lower them without touching the floor. Keep your lower back pressed to the floor.',
        fitnosExSec: 120,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/xf8MbJ7/f0df7b312b554b5fbda88bb8cdbbe4ee.jpg',
        fitnosExName: 'Barbell Curls',
        fitnosExDesc:
            'Stand straight, holding a barbell with an underhand grip, shoulder-width apart. Bend your elbows, lifting the barbell to your chest. Slowly lower the barbell back to the starting position.',
        fitnosExSec: 120,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
    ],
  ),
];

final List<FitnosModel> catePlan = [
  FitnosModel(
    fitnosKey: '9',
    fitnosImage:
        'https://i.ibb.co/C7ZHtTq/581da244fde91dc3206c67fe9f915450.jpg',
    fitnosCal: '450',
    fitnosName: 'Get Wider',
    fitnosExList: [
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/YNGVmjk/750048f5e46a99c9541780a74c227ac8.png',
        fitnosExName: 'Run',
        fitnosExDesc:
            'Find a comfortable place to run.Start with a light warm-up.Run at a moderate pace, gradually increasing your speed.Monitor your breathing and well-being.Cool down after your workout.',
        fitnosExSec: 120,
        fitnosExTag: 'Warm-up ',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/V2ZM7nQ/030dba9929e55a068300a4ca799356ce.jpg',
        fitnosExName: 'Barbell Press',
        fitnosExDesc:
            'Take a grip slightly wider than shoulder-width, lower the bar to your chest, then press it up, fully extending your arms.',
        fitnosExSec: 120,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/vhxcvwP/985b3e9966dde1e8e4e319bddaaac7ef.jpg',
        fitnosExName: 'One-Arm Dumbbell Rows',
        fitnosExDesc:
            'Stand with one foot on a bench and hold the bench with one hand for support. Hold a dumbbell in the other hand. Pull the dumbbell towards your side, bending your elbow and squeezing your shoulder blades. ',
        fitnosExSec: 120,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/r347t0W/c22918fc9cf8435284282dd08d06342c.jpg',
        fitnosExName: 'Leg Raises',
        fitnosExDesc:
            'Lie on your back with straight legs. Lift your legs until perpendicular, then lower them without touching the floor. Keep your lower back pressed to the floor.',
        fitnosExSec: 120,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/xf8MbJ7/f0df7b312b554b5fbda88bb8cdbbe4ee.jpg',
        fitnosExName: 'Barbell Curls',
        fitnosExDesc:
            'Stand straight, holding a barbell with an underhand grip, shoulder-width apart. Bend your elbows, lifting the barbell to your chest. Slowly lower the barbell back to the starting position.',
        fitnosExSec: 120,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
    ],
  ),
  FitnosModel(
    fitnosKey: '10',
    fitnosImage:
        'https://i.ibb.co/YP2YMRD/8b1f8e3d340e9628f5907d1d49b43a15.png',
    fitnosCal: '300',
    fitnosName: 'Learn the Basics',
    fitnosExList: [
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/YNGVmjk/750048f5e46a99c9541780a74c227ac8.png',
        fitnosExName: 'Run',
        fitnosExDesc:
            'Find a comfortable place to run.Start with a light warm-up.Run at a moderate pace, gradually increasing your speed.Monitor your breathing and well-being.Cool down after your workout.',
        fitnosExSec: 120,
        fitnosExTag: 'Warm-up ',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/QNcjhpQ/665ecbd92ef10611be268960541e1563.jpg',
        fitnosExName: 'Pull-ups',
        fitnosExDesc:
            'Find a stable crossbar. Grab it with an overhand grip, hands shoulder-width apart. Pull yourself up, contracting the muscles of your back and arms, until your chin is above the bar. Avoid jerking and swinging.',
        fitnosExSec: 30,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/56DzgFd/36f812a69cb087538a6064c0e1891838.png',
        fitnosExName: 'Pull-ups',
        fitnosExDesc:
            'Strengthen your upper body with this classic exercise. Lower your chest towards the floor, keeping your elbows close to your body, while maintaining a straight line from head to heels. Push back up to the starting position',
        fitnosExSec: 60,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/brNkDgt/e94eb553a24c27142a2d63bd734bf71a.jpg',
        fitnosExName: 'Crunches',
        fitnosExDesc:
            'Lie on your back with knees bent and feet on the floor. Lift your upper body using your abs, keeping your pelvis on the floor. Hold briefly at the top, then slowly lower back down.',
        fitnosExSec: 120,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/M9Xm5Lr/fd7e572da685bccf93b18291d3bee895.jpg',
        fitnosExName: 'Squats',
        fitnosExDesc:
            'Stand up straight with your feet shoulder-width apart.Bend your knees as if you are sitting on a chair.Make sure your knees do not go beyond your toes.Lower yourself down until your thighs are parallel to the floor.Return to the starting position.',
        fitnosExSec: 30,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
    ],
  ),
  FitnosModel(
    fitnosKey: '11',
    fitnosImage:
        'https://i.ibb.co/khd3gr4/2ca7d08e107285d599650e355b3259b2.png',
    fitnosCal: '200',
    fitnosName: 'If Short on Time',
    fitnosExList: [
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/fCMQfQh/9bcd31c32da31063d65e6d5365847ce2.jpg',
        fitnosExName: 'Bicycle',
        fitnosExDesc:
            'Lie on your back and simulate cycling movements with your legs. Touch your opposite elbow to your knee as you twist your torso. Ensure your lower back stays pressed to the floor.',
        fitnosExSec: 120,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/56DzgFd/36f812a69cb087538a6064c0e1891838.png',
        fitnosExName: 'Pull-ups',
        fitnosExDesc:
            'Strengthen your upper body with this classic exercise. Lower your chest towards the floor, keeping your elbows close to your body, while maintaining a straight line from head to heels. Push back up to the starting position',
        fitnosExSec: 60,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/brNkDgt/e94eb553a24c27142a2d63bd734bf71a.jpg',
        fitnosExName: 'Crunches',
        fitnosExDesc:
            'Lie on your back with knees bent and feet on the floor. Lift your upper body using your abs, keeping your pelvis on the floor. Hold briefly at the top, then slowly lower back down.',
        fitnosExSec: 120,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/r347t0W/c22918fc9cf8435284282dd08d06342c.jpg',
        fitnosExName: 'Leg Raises',
        fitnosExDesc:
            'Lie on your back with straight legs. Lift your legs until perpendicular, then lower them without touching the floor. Keep your lower back pressed to the floor.',
        fitnosExSec: 120,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/M9Xm5Lr/fd7e572da685bccf93b18291d3bee895.jpg',
        fitnosExName: 'Squats',
        fitnosExDesc:
            'Stand up straight with your feet shoulder-width apart.Bend your knees as if you are sitting on a chair.Make sure your knees do not go beyond your toes.Lower yourself down until your thighs are parallel to the floor.Return to the starting position.',
        fitnosExSec: 30,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
    ],
  ),
  FitnosModel(
    fitnosKey: '12',
    fitnosImage:
        'https://i.ibb.co/gDvBkJ2/c92461cc3677e745f8573797c9ebe0d8.jpg',
    fitnosCal: '300',
    fitnosName: 'For Beginners',
    fitnosExList: [
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/fCMQfQh/9bcd31c32da31063d65e6d5365847ce2.jpg',
        fitnosExName: 'Bicycle',
        fitnosExDesc:
            'Lie on your back and simulate cycling movements with your legs. Touch your opposite elbow to your knee as you twist your torso. Ensure your lower back stays pressed to the floor.',
        fitnosExSec: 120,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/QNcjhpQ/665ecbd92ef10611be268960541e1563.jpg',
        fitnosExName: 'Pull-ups',
        fitnosExDesc:
            'Find a stable crossbar. Grab it with an overhand grip, hands shoulder-width apart. Pull yourself up, contracting the muscles of your back and arms, until your chin is above the bar. Avoid jerking and swinging.',
        fitnosExSec: 30,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/brNkDgt/e94eb553a24c27142a2d63bd734bf71a.jpg',
        fitnosExName: 'Crunches',
        fitnosExDesc:
            'Lie on your back with knees bent and feet on the floor. Lift your upper body using your abs, keeping your pelvis on the floor. Hold briefly at the top, then slowly lower back down.',
        fitnosExSec: 120,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/M9Xm5Lr/fd7e572da685bccf93b18291d3bee895.jpg',
        fitnosExName: 'Squats',
        fitnosExDesc:
            'Stand up straight with your feet shoulder-width apart.Bend your knees as if you are sitting on a chair.Make sure your knees do not go beyond your toes.Lower yourself down until your thighs are parallel to the floor.Return to the starting position.',
        fitnosExSec: 30,
        fitnosExTag: '',
        fitnosExComplete: false,
      ),
      FitnosExModel(
        fitnoExsImage:
            'https://i.ibb.co/MpM6zft/4267c05712878d423ed315670421188f.png',
        fitnosExName: 'Stretching',
        fitnosExDesc:
            'Gently lengthen muscles, enhance joint mobility, and reduce injury risk by incorporating regular stretching into your routine. Hold each stretch for 10-30 seconds, gradually increasing the intensity as you progress.',
        fitnosExSec: 120,
        fitnosExTag: 'Hitch ',
        fitnosExComplete: false,
      ),
    ],
  ),
];
