require 'yaml'

calc_mesg = Hash.new { '' }

opget_en = <<-MSG
What operation would you like to perform?
1) add
2) subtract
3) multiply
4) divide
MSG

opget_es = <<-MSG
¿Qué operación desea realizar?
1) agregue
2) reste
3) multiplique
4) divida
MSG

opget_fr = <<-MSG
Quelle opération souhaitez-vous effectuer?
1) ajouter
2) soustraire
3) Multipliez
4) diviser
MSG

opget_de = <<-MSG
Welchen Vorgang möchten Sie durchführen?
1) hinzufügen
2) subtrahieren
3) multiplizieren
4) teilen
MSG

calc_mesg[:en] = { welcome: "Welcome to the Calculator! Enter your name:",
                   hi: "Hi ",
                   name_err: "Make sure to use a valid name.",
                   first_num: "What's the first number?",
                   num_err: "That doesn't look like a valid number",
                   second_num: "What's the second number?",
                   op_get: opget_en,
                   op_err: "Must choose 1, 2, 3, or 4.",
                   op_status: " the two numbers...",
                   result_is: "The result is: ",
                   further_calc:
                   "Do you want to perform another calculation? \
(Enter 'y' to calculate again; any other key to exit.)",
                   kthnxbye: "Thank you for using the calculator. Goodbye!",
                   op_verbs: %w(Adding Subtracting Multiplying Dividing) }

calc_mesg[:es] = { welcome: "¡Bienvenido a la calculadora! Escriba su nombre: ",
                   hi: "Hola ",
                   name_err: "Asegúrate de usar un nombre válido.",
                   first_num: "¿Cuál es el primer número?",
                   num_err: "Que no parece un número válido",
                   second_num: "¿Cuál es el segundo número?",
                   op_get: opget_es,
                   op_err: "Debe elegir 1, 2, 3, o 4",
                   op_status: " los dos números ...",
                   result_is: "El resultado es: ",
                   further_calc:
                   "¿Desea realizar otro cálculo? \
(Introduzca 'y' para calcular de nuevo; cualquier otra llave para salir.)",
                   kthnxbye: "Gracias por usar la calculadora. ¡Adiós!",
                   op_verbs: %w(Añadiendo Restando Multiplicando Dividiendo) }

calc_mesg[:fr] = { welcome: "Bienvenue sur la Calculatrice! Entrez votre nom: ",
                   hi: "Salut ",
                   name_err: "Assurez-vous d'utiliser un nom valide.",
                   first_num: "Quel est le premier numéro?",
                   num_err: "Cela ne ressemble pas à un nombre valide",
                   second_num: "Quel est le deuxième numéro?",
                   op_get: opget_fr,
                   op_err: "Doit choisir 1, 2, 3 ou 4.",
                   op_status: " Les deux nombres ...",
                   result_is: "Le résultat est: ",
                   further_calc: "Voulez-vous effectuer un autre calcul? \
(Entrez 'y' pour calculer à nouveau; Saisissez une autre touche pour quitter) ",
                   kthnxbye: "Merci d'avoir utilisé la calculatrice. \
Au revoir!",
                   op_verbs: %w(Ajout Soustraire Multiplication Diviser) }

calc_mesg[:de] = { welcome: "Willkommen beim Taschenrechner! \
Geben Sie Ihren Namen ein:",
                   hi: "Hallo ",
                   name_err: "Stellen Sie sicher, \
dass Sie einen gültigen Namen verwenden",
                   first_num: "Was ist die erste Zahl",
                   num_err: "Das sieht nicht wie eine gültige Zahl aus.",
                   second_num: "Was ist die zweite Zahl?",
                   op_get: opget_de,
                   op_err: "Müssen 1, 2, 3 oder 4 wählen.",
                   op_status: " die zwei Zahlen ...",
                   result_is: "Das Ergebnis ist: ",
                   further_calc:
                   "Möchten Sie eine weitere Berechnung durchführen? \
(Geben Sie ' y ' ein, um erneut zu berechnen;\
 Geben Sie eine beliebige andere Taste zum Beenden ein.)",
                   kthnxbye: "Vielen Dank für die Verwendung des Rechners. \
Auf wieder sehen!",
                   op_verbs: %w(Hinzufügen Subtrahieren Multiplizieren Teilen) }

langs = [:en, :es, :fr, :de]

langs.each do |ln|
  fname = "messages.yml.".insert(-1, ln.to_s)
  File.open(fname, "w") { |f| f.write(calc_mesg[ln].to_yaml) }
end
puts "All Done! :)\n"

# To read the messages:
# calc_mesg2 = YAML.load_file(fname)
