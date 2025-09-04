module starter::practica_sui {
    use std::debug::print;
    use std::string::{String, utf8};

public struct Usuario has drop {
    nombre: String,
    edad: u8,
    vivo: bool,
}

    fun practica(usuario: Usuario) {
        if (usuario.edad > 18u8) {
        print(&utf8(b"eres mayor de edad"));
        } else if (usuario.edad == 18u8) {
            print(&utf8(b"eres mayor de edad"));
        } else {
            print(&utf8(b"no eres mayor de edad"));
        }
    }

    #[test]
    fun prueba() {
        let usuario = Usuario{
            nombre: utf8(b"jacob"),
            edad: 20u8,
            vivo: true,

        };
        practica(usuario);
    }
}