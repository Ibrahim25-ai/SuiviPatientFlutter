
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../../../constants.dart';
enum SingingCharacter { doctor, patient}


class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key,required this.formKey,}) : super(key: key);

  final GlobalKey formKey;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late String _userName, _email, _password, _phoneNumber,_identity,_cin;
  SingingCharacter? _character = SingingCharacter.patient;

  bool _homeFieldVisible = false;
  void handleSelection(SingingCharacter? value) {
    setState(() {
      _character = value;
      _homeFieldVisible = value == SingingCharacter.doctor;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextFieldName(text: "Username"),
          TextFormField(
            decoration: const InputDecoration(hintText: "testtest"),
            validator: RequiredValidator(errorText: "Username is required"),
            // Let's save our username
            onSaved: (username) => _userName = username!,
          ),
          const SizedBox(height: defaultPadding),
          const TextFieldName(text: "C.I.N"),
          // Same for phone number
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(hintText: "11111111111"),
            validator: RequiredValidator(errorText: "cin is required"),
            onSaved: (cin) => _cin = cin!,
          ),
          const SizedBox(height: defaultPadding),
          // We will fixed the error soon
          // As you can see, it's a email field
         
          const TextFieldName(text: "Email"),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: "test@email.com"),
            validator: EmailValidator(errorText: "Use a valid email!"),
            onSaved: (email) => _email = email!,
          ),
          const SizedBox(height: defaultPadding),
          const TextFieldName(text: "Etat"),
          ListTile(
          title: const Text('Patient'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.patient,
            groupValue: _character,
            onChanged: handleSelection,
          ),
        ),
        ListTile(
          title: const Text('Doctor'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.doctor,
            groupValue: _character,
            onChanged: handleSelection,
          ),
        ), 
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        if(_homeFieldVisible)
          const SizedBox(height: defaultPadding),
        if(_homeFieldVisible)
          const TextFieldName(text: "Doc credential"),
        if(_homeFieldVisible)
          TextFormField(
            decoration: const InputDecoration(hintText: "+123487697"),
            validator: RequiredValidator(errorText: "Credential number is required"),
            onSaved: (identity) => _identity = identity!,
          ),
        

          const SizedBox(height: defaultPadding),
          const TextFieldName(text: "Phone"),
          // Same for phone number
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(hintText: "+123487697"),
            validator: RequiredValidator(errorText: "Phone number is required"),
            onSaved: (phoneNumber) => _phoneNumber = phoneNumber!,
          ),
          const SizedBox(height: defaultPadding),
          const TextFieldName(text: "Password"),

          TextFormField(
            // We want to hide our password
            obscureText: true,
            decoration: const InputDecoration(hintText: "******"),
            validator: passwordValidator,
            onSaved: (password) => _password = password!,
            // We also need to validate our password
            // Now if we type anything it adds that to our password
            onChanged: (pass) => _password = pass,
          ),
          const SizedBox(height: defaultPadding),
          const TextFieldName(text: "Confirm Password"),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(hintText: "*****"),
            validator: (pass) => MatchValidator(errorText: "Password do not  match").validateMatch(pass!, _password),
          ),
        ],
      ),
    );
  }
}

class TextFieldName extends StatelessWidget {
  const TextFieldName({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 3),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),
      ),
    );
  }
}
