class Usuario {
  var _id;
  var _names;
  var _lastNames;
  var _phone;
  var _address;
  var _gender;
  var _email;
  var _password;

  Usuario(this._id, this._names, this._lastNames, this._phone, this._address,
      this._gender, this._email, this._password);

  Usuario.empty();

  Usuario.fromJson(Map<String, dynamic> data)
      : _id = data['id'],
        _names = data['names'],
        _lastNames = data['lastNames'],
        _email = data['email'],
        _phone = data['phone'],
        _address = data['address'],
        _gender = data['gender'],
        _password = data['password'];

  Map<String, dynamic> convertir() => {
        'id': _id,
        'names': _names,
        'lastNames': _lastNames,
        'phone': _phone,
        'address': _address,
        'email': _email,
        'password': _password,
        'gender': _gender
      };

  get email => _email;

  set email(value) {
    _email = value;
  }

  get gender => _gender;

  set gender(value) {
    _gender = value;
  }

  get address => _address;

  set address(value) {
    _address = value;
  }

  get phone => _phone;

  set phone(value) {
    _phone = value;
  }

  get lastNames => _lastNames;

  set lastNames(value) {
    _lastNames = value;
  }

  get names => _names;

  set names(value) {
    _names = value;
  }

  get id => _id;

  set id(value) {
    _id = value;
  }

  get password => _password;

  set password(value) {
    _password = value;
  }
}
