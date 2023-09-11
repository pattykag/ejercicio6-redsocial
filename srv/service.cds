using {redsocial as my} from '../db/schema';

service api {

    entity Usuarios           as projection on my.Usuarios; // hay un error en Country
    entity Mensajes           as projection on my.Mensajes;
    entity Perfiles           as projection on my.Perfiles;
    entity Publicaciones      as projection on my.Publicaciones;
    entity Comentarios        as projection on my.Comentarios;

    entity VistaPerfil        as projection on Perfiles {
        titulo             as Perfil_Titulo,
        usuario.username   as Usuario_Username,
        publicacion.titulo as Publicacion_Titulo
    };

    entity VistaUsuArg        as
        select from Usuarios {
            *
        }
        where
                amigos       > 200
            and paisDeOrigen = 'ARG';

    entity VistaPublicaciones as
        select from Publicaciones {
            titulo                as Publicaciones_Titulo,
            cantDeVecesCompartido as Publicaciones_CantComp,
            usuario.username      as Usuario_Username
        }
        where
            cantDeVecesCompartido > 100;

}
