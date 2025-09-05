module starter::biblioteca{
    use std::string::{String, utf8};
    use sui::vec_map::{VecMap, Self};

    #[error]
    const ID_YA_EXISTE: vector<u8> = b"El id que intentas usar ya no está disponible.";

    public struct Biblioteca has key {
        id: UID,
        nombre: String,
        libros: VecMap<u32, Libro>,
        
    }

    public struct Libro has store {
        titulo: String,
        autor: String,
        publicacion: u16,
        disponible: bool,
    }
    public fun crear_biblioteca(ctx: &mut TxContext){
        let biblioteca = Biblioteca {
            id: object::new(ctx),
            nombre: utf8(b"Biblioteca de sui latina"),
            libros: vec_map::empty(),
        };

        transfer::transfer(biblioteca, tx_context::sender(ctx));

    }
 public fun agregar_libro(biblioteca: &mut Biblioteca, id: u32, titulo: String, autor: String, publicacion: u16){
    assert! (!biblioteca.libros.contains(&id), 0);
    let _libros = Libro {
        titulo,
        autor,
        publicacion,
        disponible: true,
    };
    biblioteca.libros.insert()

 }

}