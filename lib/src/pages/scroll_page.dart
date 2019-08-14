import 'package:flutter/material.dart';


class ScrollPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView( // Permite hacer un scroll entre páginas, el eje en el que hacerlo, ...
        scrollDirection: Axis.vertical, // Indica el eje en el que se va a hacer el scroll. En este caso será vertical
        children: <Widget>[
          _pagina1(),
          _pagina2(context)
        ],
      )
    );
  }

  Widget _pagina1() {
    return Stack(        // Permite crear una pila de widget, es decir, unos encima de otros. Los últimos se verán encima de los anteriores 
      children: <Widget>[
        _colorFondo(), // Más al fondo
        _imagenFondo(),
        _textos(),     // Más arriba
      ],
    );
  }


  Widget _colorFondo() {

    return Container(
      width: double.infinity, // Todo el ancho posible
      height: double.infinity, // Todo el alto posible
      color: Color.fromRGBO(108, 192, 218, 1.0),
    );

  }

  Widget _imagenFondo() {

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/scroll-1.png'),
        fit: BoxFit.cover, // Para que se expanda todo el espacio posible respetando las dimensiones de la imagen
      ),
    );

  }

  Widget _textos() {

    final estiloTexto = TextStyle(color: Colors.white, fontSize: 50.0);

    return SafeArea( // Para que se vea bien en dispositivo que tengan la ventana del notch
      child: Column(
        children: <Widget>[
          SizedBox(height: 20.0 ),
          Text('11°', style: estiloTexto ),
          Text('Miércoles', style: estiloTexto ),
          Expanded( child: Container() ),  // Estira el widget todo lo que pueda respetando los widgets hermanos
          Icon( Icons.keyboard_arrow_down, size: 70.0, color: Colors.white )
        ],
      ),
    );

  }

  Widget _pagina2(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
      child: Center(
        child: RaisedButton(
          shape: StadiumBorder(), // Bordes redondeados
          color: Colors.blue,
          textColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Text('Bienvenidos', style: TextStyle(fontSize: 20.0)),
          ),
          onPressed: ()=> Navigator.pushNamed(context, 'botones'),
        ),
      ),
    );
  }


}