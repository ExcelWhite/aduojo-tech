import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/apps/nutribot/nutribot.dart';

class Workout {
  final String name;
  final List<Exercise> exercises;

  Workout({required this.name, required this.exercises});
}

class Exercise {
  final String name;
  final String image;
  final String reps;

  Exercise({required this.name, required this.image, required this.reps});
}

class Diet {
  final String name;
  final List<Meal> meals;

  Diet({required this.name, required this.meals});
}

class Meal {
  final String name;
  final String image;
  final String description;

  Meal({required this.name, required this.image, required this.description});
}

class NutribotScreen extends StatefulWidget {
  final void Function(String screenKey) onNavigate;
  final VoidCallback onPop;
  final Size size;

  const NutribotScreen({
    super.key,
    required this.onNavigate,
    required this.onPop,
    required this.size
  });

  @override
  _NutribotScreenState createState() => _NutribotScreenState();
}

class _NutribotScreenState extends State<NutribotScreen> with SingleTickerProviderStateMixin{
  int _workoutIndex = 0;
  int _dietIndex = 0;
  bool _isLoading = false; // Track loading state
  String _loadingText = 'Generating'; // Loading text
  Timer? _loadingTimer; // Timer for loading effect


  final List<Workout> _workouts = [
    Workout(name: 'Full Body Routine 1', exercises: [
      Exercise(name: 'Push-ups', image: 'assets/images/workouts/pushups.png', reps: '3 sets of 10'),
      Exercise(name: 'Squats', image: 'assets/images/workouts/squats.png', reps: '3 sets of 15'),
      Exercise(name: 'Plank', image: 'assets/images/workouts/plank.png', reps: '3 sets of 30 seconds'),
      Exercise(name: 'Lunges', image: 'assets/images/workouts/lunges.png', reps: '3 sets of 12'),
      Exercise(name: 'Burpees', image: 'assets/images/workouts/burpees.png', reps: '3 sets of 8'),
      Exercise(name: 'Mountain Climbers', image: 'assets/images/workouts/mountain_climbers.png', reps: '3 sets of 20'),
      Exercise(name: 'Jumping Jacks', image: 'assets/images/workouts/jumping_jacks.png', reps: '3 sets of 15'),
    ]),
    Workout(name: 'Full Body Routine 2', exercises: [
      Exercise(name: 'Deadlifts', image: 'assets/images/workouts/deadlifts.png', reps: '3 sets of 10'),
      Exercise(name: 'Bench Press', image: 'assets/images/workouts/bench_press.png', reps: '3 sets of 10'),
      Exercise(name: 'Pull-ups', image: 'assets/images/workouts/pull_ups.png', reps: '3 sets of 5'),
      Exercise(name: 'Leg Press', image: 'assets/images/workouts/leg_press.png', reps: '3 sets of 12'),
      Exercise(name: 'Dumbbell Rows', image: 'assets/images/workouts/dumbbell_rows.png', reps: '3 sets of 10'),
      Exercise(name: 'Bicycle Crunches', image: 'assets/images/workouts/bicycle_crunches.png', reps: '3 sets of 15'),
      Exercise(name: 'Russian Twists', image: 'assets/images/workouts/russian_twists.png', reps: '3 sets of 15'),
    ]),
    Workout(name: 'Full Body Routine 3', exercises: [
      Exercise(name: 'Kettlebell Swings', image: 'assets/images/workouts/kettlebell_swings.png', reps: '3 sets of 12'),
      Exercise(name: 'Thrusters', image: 'assets/images/workouts/thrusters.png', reps: '3 sets of 10'),
      Exercise(name: 'Box Jumps', image: 'assets/images/workouts/box_jumps.png', reps: '3 sets of 10'),
      Exercise(name: 'Tricep Dips', image: 'assets/images/workouts/tricep_dips.png', reps: '3 sets of 10'),
      Exercise(name: 'Leg Raises', image: 'assets/images/workouts/leg_raises.png', reps: '3 sets of 15'),
      Exercise(name: 'Side Plank', image: 'assets/images/workouts/side_plank.png', reps: '3 sets of 30 seconds'),
      Exercise(name: 'High Knees', image: 'assets/images/workouts/high_knees.png', reps: '3 sets of 20'),
    ]),
    Workout(name: 'Full Body Routine 4', exercises: [
      Exercise(name: 'Barbell Squats', image: 'assets/images/workouts/barbell_squats.png', reps: '3 sets of 10'),
      Exercise(name: 'Incline Push-ups', image: 'assets/images/workouts/incline_pushups.png', reps: '3 sets of 10'),
      Exercise(name: 'Seated Rows', image: 'assets/images/workouts/seated_rows.png', reps: '3 sets of 10'),
      Exercise(name: 'Calf Raises', image: 'assets/images/workouts/calf_raises.png', reps: '3 sets of 15'),
      Exercise(name: 'Plank Shoulder Taps', image: 'assets/images/workouts/plank_shoulder_taps.png', reps: '3 sets of 10'),
      Exercise(name: 'Burpee Tuck Jumps', image: 'assets/images/workouts/burpee_tuck_jumps.png', reps: '3 sets of 8'),
      Exercise(name: 'Skaters', image: 'assets/images/workouts/skaters.png', reps: '3 sets of 15'),
    ]),
    Workout(name: 'Full Body Routine 5', exercises: [
      Exercise(name: 'Goblet Squats', image: 'assets/images/workouts/goblet_squats.png', reps: '3 sets of 10'),
      Exercise(name: 'Push Press', image: 'assets/images/workouts/push_press.png', reps: '3 sets of 10'),
      Exercise(name: 'Chin-ups', image: 'assets/images/workouts/chin_ups.png', reps: '3 sets of 5'),
      Exercise(name: 'Leg Extensions', image: 'assets/images/workouts/leg_extensions.png', reps: '3 sets of 12'),
      Exercise(name: 'Dumbbell Flyes', image: 'assets/images/workouts/dumbbell_flyes.png', reps: '3 sets of 10'),
      Exercise(name: 'Flutter Kicks', image: 'assets/images/workouts/flutter_kicks.png', reps: '3 sets of 15'),
      Exercise(name: 'Burpee Broad Jumps', image: 'assets/images/workouts/burpee_broad_jumps.png', reps: '3 sets of 8'),
    ]),
  ];

  final List<Diet> _diets = [
    Diet(name: 'Keto Diet', meals: [
      Meal(name: 'Avocado Salad', image: 'assets/images/diets/avocado_salad.png', description: 'Healthy fats and greens'),
      Meal(name: 'Grilled Chicken', image: 'assets/images/diets/grilled_chicken.png', description: 'High protein meal'),
      Meal(name: 'Zucchini Noodles', image: 'assets/images/diets/zucchini_noodles.png', description: 'Low carb alternative'),
      Meal(name: 'Cheese Omelette', image: 'assets/images/diets/cheese_omelette.png', description: 'Protein-rich breakfast'),
      Meal(name: 'Bacon and Eggs', image: 'assets/images/diets/bacon_and_eggs.png', description: 'Classic keto breakfast'),
    ]),
    Diet(name: 'Mediterranean Diet', meals: [
      Meal(name: 'Greek Salad', image: 'assets/images/diets/greek_salad.png', description: 'Fresh vegetables and feta'),
      Meal(name: 'Grilled Fish', image: 'assets/images/diets/grilled_fish.png', description: 'Rich in omega-3'),
      Meal(name: 'Hummus and Veggies', image: 'assets/images/diets/hummus_and_veggies.png', description: 'Healthy snack'),
      Meal(name: 'Quinoa Bowl', image: 'assets/images/diets/quinoa_bowl.png', description: 'High in protein and fiber'),
      Meal(name: 'Olive Oil Drizzled Pasta', image: 'assets/images/diets/olive_oil_pasta.png', description: 'Heart-healthy fats'),
    ]),
    Diet(name: 'Paleo Diet', meals: [
      Meal(name: 'Grilled Steak', image: 'assets/images/diets/grilled_steak.png', description: 'High protein meal'),
      Meal(name: 'Roasted Vegetables', image: 'assets/images/diets/roasted_vegetables.png', description: 'Nutritious side dish'),
      Meal(name: 'Fruit Salad', image: 'assets/images/diets/fruit_salad.png', description: 'Fresh and healthy dessert'),
      Meal(name: 'Egg and Spinach Scramble', image: 'assets/images/diets/egg_spinach_scramble.png', description: 'Protein-rich breakfast'),
      Meal(name: 'Chicken Stir Fry', image: 'assets/images/diets/chicken_stir_fry.png', description: 'Quick and healthy meal'),
    ]),
    Diet(name: 'Intermittent Fasting', meals: [
      Meal(name: 'Black Coffee', image: 'assets/images/diets/black_coffee.png', description: 'Zero calories drink'),
      Meal(name: 'Green Tea', image: 'assets/images/diets/green_tea.png', description: 'Antioxidant-rich beverage'),
      Meal(name: 'Bone Broth', image: 'assets/images/diets/bone_broth.png', description: 'Nutrient-dense liquid'),
      Meal(name: 'Vegetable Juice', image: 'assets/images/diets/vegetable_juice.png', description: 'Low-calorie drink'),
      Meal(name: 'Protein Shake', image: 'assets/images/diets/protein_shake.png', description: 'Quick protein source'),
    ]),
  ];

  void _generateWorkout() {
    setState(() {
      _isLoading = true; // Set loading state to true
      _loadingText = 'Generating'; // Reset loading text
    });

    // Start the loading text animation
    _loadingTimer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        _loadingText += '.'; // Add a dot to the loading text
        if (_loadingText.length > 13) {
          _loadingText = 'Generating'; // Reset after 3 dots
        }
      });
    });

    // Simulate a delay for generating workout
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _workoutIndex = (_workoutIndex + 1) % _workouts.length; // Update workout index
        _isLoading = false; // Set loading state to false
      });
      _loadingTimer?.cancel(); // Cancel the timer
    });
  }

  void _generateDiet() {
    setState(() {
      _isLoading = true; // Set loading state to true
      _loadingText = 'Generating'; // Reset loading text
    });

    // Start the loading text animation
    _loadingTimer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        _loadingText += '.'; // Add a dot to the loading text
        if (_loadingText.length > 13) {
          _loadingText = 'Generating'; // Reset after 3 dots
        }
      });
    });

    // Simulate a delay for generating diet
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _dietIndex = (_dietIndex + 1) % _diets.length; // Update diet index
        _isLoading = false; // Set loading state to false
      });
      _loadingTimer?.cancel(); // Cancel the timer
    });
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: NutribotColors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: NutribotColors.white,
          title: Row(
            children: [
              Image.asset('assets/images/logos/nb_logo.png', width: widget.size.width*0.15,),
              SizedBox(width: widget.size.width*0.2,),
              Text(
                'Nutribot AI',
                style: GoogleFonts.montserrat(
                  color: NutribotColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ],
          ),
          bottom: TabBar(
            unselectedLabelColor: NutribotColors.black,
            indicatorColor: NutribotColors.blue,
            labelColor: NutribotColors.blue,
            tabs: [
              Tab(text: 'Workout'),
              Tab(text: 'Diet'),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            _generatedContentWidget(tab: 'workout'),
            _generatedContentWidget(tab: 'diet')
          ],
        ),
      ),
    );
  }

  Widget _generatedContentWidget({required String tab}) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: tab == 'diet' ? _generateDiet : _generateWorkout,
                child: Container(
                  width: widget.size.width*0.7,
                  height: 44,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: NutribotColors.blue
                  ),
                  child: Center(
                    child: Text(
                      _isLoading
                        ? _loadingText
                        : tab == 'diet'
                          ?  'Generate Diet Plan'
                          : 'Generate Workout Plan',
                      style: GoogleFonts.montserrat(
                          color: NutribotColors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (tab == 'workout')
                        ..._workouts[_workoutIndex].exercises.map((exercise) => _exerciseTile(exercise))
                      else
                        ..._diets[_dietIndex].meals.map((meal) => _mealTile(meal)),
                    ],
                  ),
                ),
              ),
            ]
        )
    );
  }

  Widget _exerciseTile(Exercise exercise) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          'assets/images/logos/nb_logo.png',//exercise.image,
          width: 50,
          height: 50
        ),
        title: Text(exercise.name, style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
        subtitle: Text(exercise.reps),
      ),
    );
  }

  Widget _mealTile(Meal meal) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          'assets/images/logos/nb_logo.png', //meal.image,
          width: 50,
          height: 50
        ),
        title: Text(meal.name, style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
        subtitle: Text(meal.description),
      ),
    );
  }
}
