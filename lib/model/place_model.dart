class Place {
  var _id;
  var _nombre;
  var _descripcion;
  var _ciudad;
  var _departamento;
  var _img;

  //Place.empty();

  get id => _id;

  set id(value) {
    _id = value;
  }

  Place.fromJson(Map<String, dynamic> data)
      : _id = data['id'],
        _nombre = data['nombre'],
        _descripcion = data['descripcion'],
        _img = data['img'],
        _ciudad = data['ciudad'],
        _departamento = data['departamento'];

  Map<String, dynamic> convertir() => {
        'id': _id,
        'nombre': _nombre,
        'descripcion': _descripcion,
        'departamento': _departamento,
        'img': _img,
        'ciudad': _ciudad
      };

  Place(this._id, this._nombre, this._descripcion, this._ciudad,
      this._departamento, this._img);

  get nombre => _nombre;

  set nombre(value) {
    _nombre = value;
  }

  get descripcion => _descripcion;

  set descripcion(value) {
    _descripcion = value;
  }

  get ciudad => _ciudad;

  set ciudad(value) {
    _ciudad = value;
  }

  get departamento => _departamento;

  set departamento(value) {
    _departamento = value;
  }

  get img => _img;

  set img(value) {
    _img = value;
  }
}
