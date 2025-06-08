import 'package:flutter/material.dart';

class DiseaseInfoScreen extends StatefulWidget {
  final String diseaseName;

  const DiseaseInfoScreen({required this.diseaseName, super.key});

  @override
  State<DiseaseInfoScreen> createState() => _DiseaseInfoScreenState();
}

class _DiseaseInfoScreenState extends State<DiseaseInfoScreen> {
  Map<String, String> sections = {};
  Map<String, bool> isExpanded = {};
  String image = '';

  @override
  void initState() {
    super.initState();
    _parseDiseaseInfo();
  }

  void _parseDiseaseInfo() {
    String info = '';
    switch (widget.diseaseName) {
      case 'Diabetes Mellitus':
        info = '''
**Overview**
Diabetes mellitus is a group of common endocrine diseases characterized by sustained high blood sugar levels. Diabetes is due to either the pancreas not producing enough of the hormone insulin, or the cells of the body becoming unresponsive to insulin's effects.

**Types of Diabetes**
- Type 1 Diabetes: This happens when the body doesn't make insulin. It usually starts in childhood or teenage years. (Should use insulin in treatment)
- Type 2 Diabetes: This is the most common type. The body doesn't use insulin properly. It usually happens in adults, but can happen to children too.

**Hyperglycemia vs Hypoglycemia**
- Hyperglycemia: Happens when there's too much sugar (glucose) in your blood. Postprandial blood sugar level above 180 mg/dL (10.0 mmol/L). Severe if above 250 mg/dL (13.9 mmol/L), requiring medical intervention. Caused by too little insulin or insulin resistance. **Action:** Measure blood sugar, take correction insulin as directed by your doctor, see a doctor if above 250 mg/dL three times.
- Hypoglycemia: Blood sugar level below 70 mg/dL (3.9 mmol/L). Severe if below 54 mg/dL (3.0 mmol/L). Action: If conscious: Give half a cup of juice or a spoonful of honey, wait 15 minutes, retest. If unconscious: Do not give by mouth, call emergency, use glucagon if available.

**Diet**
- Carbohydrates: Affect blood sugar the most. Choose healthy ones like oatmeal, vegetables, fruits, and brown rice. Avoid fast carbs like white bread or soft drinks.
- Proteins: Important for building muscle. Examples: eggs, beans, lentils, chicken, fish.
- Healthy Fats: Good for heart and brain. Found in olive oil, avocado, nuts, fish.

**Daily Routine (Dr. Buzzy's Suggestion)**
- Breakfast (7-8 AM): Whole meal toast + boiled egg or light cheese, cucumber and tomato + skim milk.
- Snack (10 AM): Small apple or sugar-free yogurt.
- Lunch (1-2 PM): Grilled chicken or lean meat, half cup rice or pasta + cooked vegetables, simple salad.
- Snack (4-5 PM): Handful of nuts or low-sugar granola.
- Dinner (7-8 PM): Grilled fish or chicken, half cup mashed potatoes or brown rice, boiled vegetables + small fruit.
- Bedtime Snack (if necessary): Salt crackers + milk or two crackers with cheese.

**Banana Oat Cupcakes Recipe**
- Ingredients: 1/2 kilo bananas, 1/2 cup oatmeal, 1/2 tsp baking soda, 1 tsp baking powder, 1 cup water, 1/4 cup coconut oil.
- Method: Mash bananas, add oats, baking powder, and soda. Add water, oil, and honey, stir until smooth. Spread into cupcake cases, bake for 30 minutes.
''';
        image = 'assets/diabetes.png';
        break;
      case 'Obesity':
        info = '''
**Overview**
Obesity is a chronic complex disease defined by excessive fat deposits that can impair health. It can lead to increased risk of type 2 diabetes and heart disease, affect bone health and reproduction, and increase the risk of certain cancers. It influences the quality of living, such as sleeping or moving.

**Diagnosis**
Diagnosis is made by measuring weight and height, calculating BMI: weight (kg)/height² (m²).

**Tips for Healthy Lifestyle**
- Ensure children and teens get enough sleep; too little sleep is associated with obesity.
- Limit screen time to avoid poor sleep, weight gain, and unhealthy eating.
- Encourage healthy eating: Plenty of vegetables, fruits, whole grains, lean meats, low-fat dairy, water instead of sugary drinks, limit saturated fat, sugar, and salt.
- Promote active play with friends and family.
''';
        image = 'assets/obesity.png';
        break;
      case 'Hand, Foot and Mouth':
        info = '''
**Overview**
Hand-foot-and-mouth disease is a common viral illness in young children, affecting hands, feet, and sometimes buttocks. Coxsackieviruses are the most common cause. Most people recover in 7-10 days.

**Treatment (Dr. Buzzy's Advice)**
1. Fire Down the Fever! Use Paracetamol or Ibuprofen (no aspirin for children).
2. Super Sips Save the Day: Stay hydrated with water, milk, smoothies, or ice pops; avoid spicy or sour foods.
3. Mouth Blisters? Ice Cream is the Cure! Use soft, chilly foods like yogurt or ice cream.
4. Rash Patrol Activated! Use Calamine lotion and wear comfy clothes.
5. No Sharing with Germy Invaders! Wash hands, clean toys/surfaces, stay home until blisters heal.
6. Sleep: Your Secret Weapon for recovery.

**Prevention**
Wash hands frequently, avoid close contact with infected individuals.
''';
        image = 'assets/hfm.png';
        break;
      case 'Chicken Pox':
        info = '''
**Overview**
Chickenpox is a highly contagious infection commonly affecting children, though it can occur at any age. It usually resolves within 1-2 weeks.

**Symptoms**
An itchy rash of red spots appears, starting on the face, chest, and back, then spreading. Appears up to 21 days after exposure.

**Stages**
- Stage 1: Small red spots appear, possibly inside the mouth.
- Stage 2: Spots become fluid-filled blisters, very itchy, may leak if burst.
- Stage 3: Scabs and crusts form over burst blisters.

**Spread**
- Direct contact, sneezing, coughing, or contact with infected clothing/bed linen.

**School**
Stay home until all blisters have scabbed over. Dangerous for pregnant women, newborns, and those with weakened immune systems.

**Prevention**
Vaccination and good hygiene.
''';
        image = 'assets/chickenpox.png';
        break;
      case 'Anemia':
        info = '''
**Overview**
Anemia is a condition where the blood lacks enough healthy red blood cells, affecting a child's energy, development, and overall health.

**Types of Anemia**
- Iron Deficiency Anemia: Caused by poor iron intake, blood loss, or poor absorption. Symptoms include pica (craving ice). Treatment: Iron supplements, iron-rich foods (meat, beans, leafy greens).
- Vitamin Deficiency Anemia: Due to lack of B12 or folic acid, poor diet/absorption. Symptoms include red beef tongue. Treatment: Vitamin supplements, diet adjustment.
- Hemolytic Anemia: Red blood cells break down faster than replaced. Includes B-thalassemia (enzyme deficiency) and sickle cell anemia (abnormal hemoglobin causing rigid cells).

**Diagnostic Tests**
- Complete Blood Count (CBC), Hemoglobin/Hematocrit, Peripheral Blood Smear, Iron Studies, Reticulocyte Count.

**Iron-Rich Foods**
- Heme: Red meat, poultry, seafood, eggs.
- Non-heme: Legumes, leafy vegetables, dried fruits (with vitamin C for absorption).
''';
        image = 'assets/anemia.png';
        break;
    }

    // Parse the info into sections
    List<String> lines = info.trim().split('\n');
    String? currentHeader;
    StringBuffer currentContent = StringBuffer();

    for (var line in lines) {
      if (line.startsWith('**') && line.endsWith('**')) {
        if (currentHeader != null) {
          sections[currentHeader] = currentContent.toString().trim();
          currentContent.clear();
        }
        currentHeader = line.replaceAll('**', '').trim();
        isExpanded[currentHeader] = false;
      } else if (currentHeader != null) {
        currentContent.writeln(line);
      }
    }
    if (currentHeader != null && currentContent.isNotEmpty) {
      sections[currentHeader] = currentContent.toString().trim();
    }
  }

  @override
  Widget build(BuildContext context) {
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
              if (image.isNotEmpty) Image.asset(image),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: sections.entries.map((entry) {
                    String cardImage = '';
                    switch (entry.key) {
                      case 'Overview':
                        switch (widget.diseaseName) {
                          case 'Diabetes Mellitus':
                            cardImage = 'assets/dr_buzz_logo.png';
                            break;
                          case 'Obesity':
                            cardImage = 'assets/dr_buzz_logo.png';
                            break;
                          case 'Hand, Foot and Mouth':
                            cardImage = 'assets/dr_buzz_logo.png';
                            break;
                          case 'Chicken Pox':
                            cardImage = 'assets/dr_buzz_logo.png';
                            break;
                          case 'Anemia':
                            cardImage = 'assets/dr_buzz_logo.png';
                            break;
                        }
                        break;
                      case 'Types of Diabetes':
                        cardImage = 'assets/dr_buzz_logo.png';
                        break;
                      case 'Types of Anemia':
                        cardImage = 'assets/anemia_types.jpg';
                        break;
                      case 'Hyperglycemia vs Hypoglycemia':
                        cardImage = 'assets/dr_buzz_logo.png';
                        break;
                      case 'Diagnosis':
                        cardImage = 'assets/obesity_diagnosis.jpg';
                        break;
                      case 'Treatment (Dr. Buzzy\'s Advice)':
                        cardImage = 'assets/dr_buzz_logo.png';
                        break;
                      case 'Symptoms':
                        cardImage = 'assets/chickenpox_symptoms.jpg';
                        break;
                      case 'Stages':
                        cardImage = 'assets/chickenpox_stages.jpg';
                        break;
                      case 'Diet':
                        cardImage = 'assets/diabetes_diet.jpg';
                        break;
                      case 'Tips for Healthy Lifestyle':
                        cardImage = 'assets/obesity_tips.jpg';
                        break;
                      case 'Iron-Rich Foods':
                        cardImage = 'assets/anemia_iron.jpg';
                        break;
                      case 'Daily Routine (Dr. Buzzy\'s Suggestion)':
                        cardImage = 'assets/diabetes_routine.jpg';
                        break;
                      case 'Prevention':
                        cardImage = 'assets/hfm_prevention.jpg';
                        break;
                      case 'Banana Oat Cupcakes Recipe':
                        cardImage = 'assets/diabetes_recipe.jpg';
                        break;
                      case 'Spread':
                        cardImage = 'assets/dr_buzz_logo.png';
                        break;
                      case 'School':
                        cardImage = 'assets/chickenpox_school.jpg';
                        break;
                    }
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
                                entry.key,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              trailing: Icon(
                                isExpanded[entry.key]!
                                    ? Icons.expand_less
                                    : Icons.expand_more,
                                color: Colors.white,
                              ),
                              onTap: () {
                                setState(() {
                                  isExpanded[entry.key] = !isExpanded[entry.key]!;
                                });
                              },
                            ),
                            if (isExpanded[entry.key]!)
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      entry.value,
                                      style: const TextStyle(
                                        color: Colors.black87,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    if (cardImage.isNotEmpty)
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: Image.asset(
                                          cardImage,
                                          width: 250,
                                          height: 150,
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