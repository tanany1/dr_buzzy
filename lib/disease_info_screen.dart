import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DiseaseInfoScreen extends StatefulWidget {
  final String diseaseName;

  const DiseaseInfoScreen({required this.diseaseName, super.key});

  @override
  State<DiseaseInfoScreen> createState() => _DiseaseInfoScreenState();
}

class _DiseaseInfoScreenState extends State<DiseaseInfoScreen> {
  Map<String, Map<String, dynamic>> diseaseData = {};
  Map<String, bool> isExpanded = {};
  final TextEditingController _glucoseController = TextEditingController();
  String _glucoseFeedback = '';

  @override
  void initState() {
    super.initState();
    _initializeDiseaseData();
    _initializeExpandedStates();
  }

  @override
  void dispose() {
    _glucoseController.dispose();
    super.dispose();
  }

  void _initializeDiseaseData() {
    diseaseData = {
      'Diabetes Mellitus': {
        'headerImage': 'assets/diabetes.png',
        'sections': {
          'Overview': {
            'content': '''Diabetes mellitus is a group of common endocrine diseases characterized by sustained high blood sugar levels. Diabetes is due to either the pancreas not producing enough of the hormone insulin, or the cells of the body becoming unresponsive to insulin's effects.''',
            'image': ''
          },
          'Symptoms': {
            'content': '''Symptoms of diabetes mellitus typically include:
• Increased thirst
• Frequent urination
• Fatigue
• Blurred vision
• Unexplained weight loss
• Slow-healing wounds''',
            'image': 'assets/diabetes_symptoms.jpg'
          },
          'Types of Diabetes': {
            'content': '''**Type 1 Diabetes:** This happens when the body doesn't make insulin. It usually starts in childhood or teenage years. (Should use insulin in treatment)

**Type 2 Diabetes:** This is the most common type. The body doesn't use insulin properly. It usually happens in adults, but can happen to children too.''',
            'image': ''
          },
          'Hyperglycemia vs Hypoglycemia': {
            'content': '''**Hyperglycemia:**
• Happens when there's too much sugar (glucose) in your blood
• Postprandial (after eating) blood sugar level above 180 mg/dL (10.0 mmol/L)
• Blood sugar level above 250 mg/dL (13.9 mmol/L) is considered severe
• Actions: Measure blood sugar, take correction insulin as directed, see doctor if persistent

**Hypoglycemia:**
• Blood sugar (glucose) level lower than standard range
• Blood sugar level below 70 mg/dL (3.9 mmol/L)
• Blood sugar level below 54 mg/dL (3.0 mmol/L) is considered severe
• **If Conscious:** Give half cup of juice or spoonful of honey, wait 15 minutes, retest
• **If Unconscious:** Do not give anything by mouth, call emergency, use glucagon if available''',
            'images': ['assets/Hyperglycemia.jpg']
          },
          'Site of Injection': {
            'content': '''Insulin injection sites include:
• Abdomen (fastest absorption)
• Thighs
• Buttocks
• Upper arms
Rotate injection sites to prevent lipodystrophy.''',
            'image': 'assets/injection_sites.jpg'
          },
          'Diet': {
            'content': '''**Carbohydrates:**
• Affect blood sugar the most
• Must be carefully calculated and balanced with insulin dosage
• Choose healthy carbohydrates: oatmeal, vegetables, fruits, brown rice
• Avoid fast carbohydrates: white bread, soft drinks

**Proteins:**
• Important for building muscle
• Sources: eggs, beans, lentils, chicken, fish

**Healthy Fats:**
• Important for heart and brain
• Sources: olive oil, avocado, nuts, fish''',
            'image': 'assets/diabetes_routine.jpg'
          },
          'How to Create a Diabetes Friendly Meal': {
            'image': 'assets/diabetes_diet.jpg'
          },
          'Daily Routine (Dr. Buzzy\'s Suggestion)': {
            'content': '''**Breakfast (7-8 AM):**
Whole meal toast + boiled egg or light cheese
Cucumber and tomato + cup of skim milk

**Snack (10 AM):**
Small apple or cup of sugar-free natural yogurt

**Lunch (1-2 PM):**
Grilled chicken or lean meat
Half cup of rice or pasta + cooked vegetables
Simple salad

**Snack (4-5 PM):**
Handful of nuts or low-sugar granola

**Dinner (7-8 PM):**
Grilled fish or chicken
Half cup of mashed potatoes or brown rice
Boiled vegetables + small piece of fruit

**Bedtime Snack (if necessary):**
Salt crackers + milk or two crackers with cheese''',
            'image': ''
          },
          'Banana Oat Cupcakes Recipe': {
            'content': '''Healthy cupcakes for diabetics:

**Ingredients:**
• 1/2 kilo bananas
• 1/2 cup oatmeal
• 1/2 teaspoon baking soda
• 1 teaspoon baking powder
• 1 cup water
• 1/4 cup coconut oil

**Preparation:**
1. Mash bananas well, add oats, baking powder, and baking soda
2. Add water, oil, and honey, stir until smooth
3. Spread batter into cupcake cases
4. Bake in oven for 30 minutes''',
            'image': 'assets/diabetes_recipe.jpg'
          },
          'Physical Exercises': {
            'content': '''Regular physical activity helps:
• Improve insulin sensitivity
• Lower blood glucose levels
• Maintain healthy weight
• Strengthen cardiovascular system

**Recommended exercises:**
• Walking (30 minutes daily)
• Swimming
• Cycling
• Strength training (2-3 times per week)
• Always monitor blood sugar before and after exercise''',
            'images': ['assets/diabetes_exercise.jpg' , 'assets/diabetes_exercises.jpg']
          },
          'Random Blood Glucose Level': {
            'content': '''Enter your random blood glucose level below to check if it falls within normal, hyperglycemic, or hypoglycemic ranges.''',
            'image': '',
            'hasGlucoseInput': true
          }
        }
      },
      'Obesity': {
        'headerImage': 'assets/obesity.png',
        'sections': {
          'Overview': {
            'content': '''• Obesity is a chronic complex disease defined by excessive fat deposits that can impair health.
• Obesity can lead to increased risk of type 2 diabetes and heart disease, it can affect bone health and reproduction, it increases the risk of certain cancers.
• Obesity influences the quality of living, such as sleeping or moving.''',
            'image': ''
          },
          'Diagnosis': {
            'content': '''The diagnosis of overweight and obesity is made by measuring people's weight and height and by calculating the body mass index (BMI): weight (kg)/height² (m²).

**BMI Categories:**
• Underweight: Below 18.5
• Normal weight: 18.5-24.9
• Overweight: 25-29.9
• Obese: 30 and above

**Calculate your BMI:** https://www.calculator.net/bmi-calculator.html''',
            'image': '',
            'hasLink': true,
            'linkUrl': 'https://www.calculator.net/bmi-calculator.html',
            'linkText': 'BMI Calculator'
          },
          'Causes': {
            'content': '''Common causes of obesity include:
• Poor dietary habits
• Lack of physical activity
• Genetic factors
• Medical conditions
• Medications
• Environmental factors
• Psychological factors''',
            'image': 'assets/obesity_diagnosis.jpg'
          },
          'How Obesity Starts': {
            'image': 'assets/obesity_development.jpg'
          },
          'Tips for Healthy Lifestyle': {
            'content': '''**Sleep:**
Make sure children and teens get enough sleep. Too little sleep is associated with obesity.

**Screen Time:**
Limit television, video games, smartphone, and tablet use. Encourage fun activities with friends and family.

**Healthy Eating:**
• Provide plenty of vegetables, fruits, and whole-grain products
• Choose lean meats, poultry, fish, lentils, and beans for protein
• Include low-fat or non-fat dairy products
• Encourage water instead of sugary drinks
• Limit saturated fat, added sugar, and salt''',
            'images': ['assets/sleep_tips.jpg', 'assets/screen_time.jpg', 'assets/healthy_eating.jpg']
          },
          'Help Children to Stay Active': {
            'image': 'assets/children_active.jpg'
          },
          'Dr. Buzzy\'s Healthy Recipes': {
            'images': ['assets/obesity_recipes.jpg', 'assets/obesity_recipes2.jpg']
          }
        }
      },
      'Hand, Foot and Mouth': {
        'headerImage': 'assets/hfm.png',
        'sections': {
          'Overview': {
            'content': '''Hand-foot-and-mouth disease is a common viral illness in young children. It affects hand, foot and mouth and sometimes buttocks. Coxsackieviruses are the most common cause of hand-foot-and-mouth disease. Most people get better in 7 to 10 days.''',
            'image': ''
          },
          'Symptoms': {
            'content': '',
            'image': 'assets/hfm_symptoms.jpg'
          },
          'How is it Spread?': {
            'content': '''HFM spreads through:
• Contact with infected saliva, nasal secretions
• Contact with fluid from blisters
• Contact with infected stool
• Respiratory droplets from coughing or sneezing
• Touching contaminated surfaces
• Close contact with infected person''',
            'image': 'assets/hfm_spread.jpg'
          },
          'What is the Difference Between Chicken Pox and Hand, Foot and Mouth?': {
            'content': '''**Chicken Pox:**
The itchy, red rash starts on the face, chest, and back, then spreads to the rest of the body.

**Hand, Foot and Mouth:**
Itchy, red rash starts on hand, mouth, and foot.''',
            'image': ''
          },
          'Treatment (Dr. Buzzy\'s Advice)': {
            'content': '''Hello, brave young hero! HFMD has invaded, but don't worry - you've got the tools to defeat it:

**1. Fire Down the Fever!**
• Use Mr. Cool (Paracetamol) or Captain Ibuprofen
• Warning: No aspirin for children

**2. Super Sips Save the Day:**
• Keep hydration as your target!
• Water, milk, smoothies, or ice pops
• Avoid spicy or sour foods

**3. Mouth Blisters? Ice Cream is the Cure!**
• Soft, chilly foods like yogurt and ice cream calm mouth spots

**4. Rash Patrol Activated!**
• Use Lotion League (like Calamine) for spots
• Wear super-comfy clothes

**5. No Sharing with Germy Invaders!**
• Wash hands like a soap superhero
• Clean toys and surfaces
• Stay home until blisters are gone

**6. Sleep: Your Secret Weapon**
• Rest to recover energy and defeat the virus!''',
            'image': ''
          },
          'How to Prevent Spread of HFM?': {
            'content': '',
            'image': 'assets/hfm_prevention.jpg'
          }
        }
      },
      'Chicken Pox': {
        'headerImage': 'assets/chickenpox.png',
        'sections': {
          'Overview': {
            'content': '''Chickenpox is an infection that commonly affects little heroes, although you can get it at any age. It is highly contagious to people that haven't previously had chickenpox, but don't worry - it usually goes away on its own within one to two weeks.''',
            'image': ''
          },
          'Symptoms': {
            'content': '''Chickenpox presents as an itchy rash consisting of red spots. Any area of the body can be affected. The rash usually appears up to 21 days after exposure to the virus.

**Common symptoms:**
• Itchy, red rash
• Fever
• Headache
• Fatigue
• Loss of appetite
• Body aches''',
            'image': 'assets/chickenpox_symptoms.jpg'
          },
          'What is the Difference Between Chicken Pox and Hand, Foot and Mouth?': {
            'content': '''**Chicken Pox:**
The itchy, red rash starts on the face, chest, and back, then spreads to the rest of the body.

**Hand, Foot and Mouth:**
Itchy, red rash starts on hand, mouth, and foot.''',
            'image': ''
          },
          'Stages of Chickenpox': {
            'content': '''**Stage 1:**
Small red spots appear on the body, including possibly inside the mouth.

**Stage 2:**
The spots become blisters filled with fluid. These can be extremely itchy and may leak if they burst.

**Stage 3:**
Scabs and crusts form over the burst blisters.''',
            'image': 'assets/chickenpox_stages.jpg'
          },
          'How is it Spread?': {
            'content': '''Chickenpox spreads through:
1. Person to person by direct contact (touching)
2. Sneezing or coughing (respiratory droplets)
3. Contact with clothing or bed linen of infected person
4. Contact with fluid from blisters''',
            'image': ''
          },
          'Do I Need to Stop Going to School?': {
            'content': '''**Yes, you need to stay home because:**
• Chickenpox is highly contagious
• Stay away from school and other children until all blisters have scabbed over
• Chickenpox can be dangerous for pregnant people, newborn babies, and people with weakened immune systems
• Usually takes 5-7 days for all blisters to scab over''',
            'image': ''
          },
          'How to Prevent It?': {
            'content': '',
            'image': 'assets/chickenpox_prevention.jpg'
          }
        }
      },
      'Anemia': {
        'headerImage': 'assets/anemia.png',
        'sections': {
          'Overview': {
            'content': '''Anemia is a condition in which the blood doesn't have enough healthy red blood cells. It can affect a child's energy, development, and overall health.''',
            'image': ''
          },
          'Symptoms': {
            'content': '',
            'image': 'assets/anemia_symptoms.jpg'
          },
          'Types of Anemia': {
            'content': '''**Iron Deficiency Anemia:**
**Causes:** Poor dietary intake of iron, blood loss, poor absorption of iron
**Symptoms:** General anemia symptoms plus pica symptom (craving ice)
**Treatment:** Iron supplements, iron-rich foods

**Vitamin Deficiency Anemia:**
**Causes:** Lack of vitamin B12 and folic acid, poor diet or absorption issues
**Symptoms:** General anemia symptoms plus red beef tongue
**Treatment:** Vitamin supplements, diet adjustment,

**Hemolytic Anemia:**
Blood disorder where red blood cells break down faster than body can replace them

**Types include:**
• **B-thalassemia:** Low enzyme levels, treatment depends on cause
• **Sickle cell anemia:** Inherited condition with abnormal hemoglobin causing rigid cells''',
            'image': 'assets/red_beef_tongue.jpg'
          },
          'Diagnostic Tests for Anemia': {
            'content': '''**Common tests include:**
• **Complete Blood Count (CBC):** Overall red blood cell information
• **Hemoglobin and Hematocrit:** Measure amount and concentration of red blood cells
• **Peripheral Blood Smear:** Examines shape and size of red blood cells
• **Iron Studies:** Evaluate iron levels and storage (Iron, Ferritin, TIBC)
• **Reticulocyte Count:** Measures young red blood cells to assess bone marrow activity''',
            'image': ''
          },
          'Examples of Food Rich in Iron': {
            'content': '''**Heme Iron (from animal sources - easily absorbed):**
• Red meat: beef, lamb, venison
• Poultry
• Seafood: oysters, sardines, tuna
• Eggs, especially egg yolks

**Non-heme Iron (from plant sources - take with vitamin C for better absorption):**
• Legumes: lentils, chickpeas, kidney beans
• Leafy vegetables: spinach, kale
• Dried fruits: apricots, raisins, prunes
• Fortified cereals and grains

**Vitamin C Examples (to enhance iron absorption):**
• Citrus fruits: oranges, lemons, grapefruits
• Berries: strawberries, blueberries, raspberries
• Bell peppers (red, yellow, green)
• Tomatoes and tomato juice
• Kiwi fruit
• Broccoli and Brussels sprouts
• Cantaloupe and papaya''',
            'images': ['assets/iron_recipes.jpg', 'assets/iron_recipes2.jpg']
          },
          'Dr. Buzzy\'s Iron Booster Recipes': {
            'content': '''Healthy iron-rich recipes:
• Spinach and lentil soup
• Beef and vegetable stew
• Iron-fortified smoothies with spinach and fruits
• Quinoa salad with beans and dried fruits
• Grilled chicken with steamed broccoli
• Tuna and white bean salad
• Always pair with vitamin C-rich foods for better absorption''',
            'image': 'assets/anemia_iron.jpg'
          }
        }
      }
    };
  }

  void _initializeExpandedStates() {
    final currentDisease = diseaseData[widget.diseaseName];
    if (currentDisease != null) {
      final sections = currentDisease['sections'] as Map<String, dynamic>;
      for (String sectionName in sections.keys) {
        // Expand 'Random Blood Glucose Level' by default for diabetes
        if (sectionName == 'Random Blood Glucose Level' && widget.diseaseName == 'Diabetes Mellitus') {
          isExpanded[sectionName] = true;
        } else {
          isExpanded[sectionName] = false;
        }
      }
    }
  }

  void _validateGlucoseLevel(String value) {
    setState(() {
      _glucoseFeedback = '';
      if (value.isEmpty) return;
      try {
        double glucose = double.parse(value);
        if (glucose < 54) {
          _glucoseFeedback = 'Severe Hypoglycemia: Below 54 mg/dL. Do not give anything by mouth if unconscious. Call emergency services immediately.';
        } else if (glucose < 70) {
          _glucoseFeedback = 'Hypoglycemia: Below 70 mg/dL. If conscious, give half a cup of juice or a spoonful of honey, wait 15 minutes, and retest.';
        } else if (glucose > 250) {
          _glucoseFeedback = 'Severe Hyperglycemia: Above 250 mg/dL. Take correction insulin as directed and consult a doctor if persistent.';
        } else if (glucose > 180) {
          _glucoseFeedback = 'Hyperglycemia: Above 180 mg/dL. Monitor and consider correction insulin as directed by your doctor.';
        } else {
          _glucoseFeedback = 'Normal Range: Your blood glucose level is within a safe range.';
        }
      } catch (e) {
        _glucoseFeedback = 'Please enter a valid number.';
      }
    });
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  void _showImageDialog(String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.8,
              maxWidth: MediaQuery.of(context).size.width * 0.9,
            ),
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 300,
                        height: 200,
                        color: Colors.grey[300],
                        child: const Icon(
                          Icons.image_not_supported,
                          color: Colors.grey,
                          size: 50,
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildRichText(String text) {
    List<TextSpan> spans = [];
    List<String> parts = text.split('**');

    for (int i = 0; i < parts.length; i++) {
      if (i % 2 == 0) {
        // Regular text
        spans.add(TextSpan(
          text: parts[i],
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 16,
          ),
        ));
      } else {
        // Bold text
        spans.add(TextSpan(
          text: parts[i],
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ));
      }
    }

    return RichText(
      text: TextSpan(children: spans),
      textAlign: TextAlign.left,
    );
  }

  Widget _buildClickableImage(String imagePath) {
    return GestureDetector(
      onTap: () => _showImageDialog(imagePath),
      child: Image.asset(
        imagePath,
        width: 250,
        height: 150,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: 250,
            height: 150,
            color: Colors.grey[300],
            child: const Icon(
              Icons.image_not_supported,
              color: Colors.grey,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentDisease = diseaseData[widget.diseaseName];
    if (currentDisease == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.diseaseName),
          backgroundColor: Colors.yellow[700],
        ),
        body: const Center(
          child: Text('Disease information not found'),
        ),
      );
    }

    final sections = currentDisease['sections'] as Map<String, dynamic>;
    final headerImage = currentDisease['headerImage'] as String?;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.diseaseName),
        backgroundColor: Colors.yellow[700],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (headerImage != null && headerImage.isNotEmpty)
                GestureDetector(
                  onTap: () => _showImageDialog(headerImage),
                  child: Image.asset(
                    headerImage,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.grey[300],
                        child: const Icon(
                          Icons.image_not_supported,
                          color: Colors.grey,
                          size: 50,
                        ),
                      );
                    },
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: sections.entries.map<Widget>((entry) {
                    final sectionName = entry.key;
                    final sectionData = entry.value as Map<String, dynamic>;
                    final content = sectionData['content'] as String? ?? '';
                    final image = sectionData['image'] as String? ?? '';

                    // Safe casting for images list
                    List<String> images = [];
                    if (sectionData['images'] != null) {
                      if (sectionData['images'] is List) {
                        images = (sectionData['images'] as List).cast<String>();
                      }
                    }

                    final hasGlucoseInput = sectionData['hasGlucoseInput'] as bool? ?? false;
                    final hasLink = sectionData['hasLink'] as bool? ?? false;
                    final linkUrl = sectionData['linkUrl'] as String? ?? '';
                    final linkText = sectionData['linkText'] as String? ?? '';

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Card(
                        color: Colors.yellow[600],
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                sectionName,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              trailing: Icon(
                                isExpanded[sectionName] == true
                                    ? Icons.expand_less
                                    : Icons.expand_more,
                                color: Colors.white,
                              ),
                              onTap: () {
                                setState(() {
                                  isExpanded[sectionName] = !(isExpanded[sectionName] ?? false);
                                });
                              },
                            ),
                            if (isExpanded[sectionName] == true)
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (content.isNotEmpty) ...[
                                      _buildRichText(content),
                                      // For obesity tips section, add images after each paragraph
                                      if (sectionName == 'Tips for Healthy Lifestyle' && images.isNotEmpty) ...[
                                        const SizedBox(height: 16),
                                        ...images.asMap().entries.map((entry) {
                                          return Padding(
                                            padding: const EdgeInsets.only(bottom: 16.0),
                                            child: Center(child: _buildClickableImage(entry.value)),
                                          );
                                        }).toList(),
                                      ],
                                    ],
                                    if (hasLink && linkUrl.isNotEmpty)
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: GestureDetector(
                                          onTap: () => _launchUrl(linkUrl),
                                          child: Text(
                                            linkText,
                                            style: const TextStyle(
                                              color: Colors.blue,
                                              decoration: TextDecoration.underline,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (hasGlucoseInput && widget.diseaseName == 'Diabetes Mellitus')
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 16),
                                          TextField(
                                            controller: _glucoseController,
                                            keyboardType: TextInputType.number,
                                            decoration: const InputDecoration(
                                              labelText: 'Enter Blood Glucose Level (mg/dL)',
                                              border: OutlineInputBorder(),
                                              filled: true,
                                              fillColor: Colors.white,
                                            ),
                                            onChanged: _validateGlucoseLevel,
                                          ),
                                          if (_glucoseFeedback.isNotEmpty)
                                            Padding(
                                              padding: const EdgeInsets.only(top: 8.0),
                                              child: Text(
                                                _glucoseFeedback,
                                                style: TextStyle(
                                                  color: _glucoseFeedback.contains('Severe')
                                                      ? Colors.red
                                                      : Colors.black87,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    // Handle multiple images for sections that need them
                                    if (images.isNotEmpty && sectionName != 'Tips for Healthy Lifestyle')
                                      Padding(
                                        padding: const EdgeInsets.only(top: 16.0),
                                        child: Column(
                                          children: images.map((imagePath) {
                                            return Padding(
                                              padding: const EdgeInsets.only(bottom: 8.0),
                                              child: Center(child: _buildClickableImage(imagePath)),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    // Handle single image
                                    if (image.isNotEmpty)
                                      Padding(
                                        padding: const EdgeInsets.only(top: 16.0),
                                        child: Center(child: _buildClickableImage(image)),
                                      ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.yellow[50],
    );
  }
}