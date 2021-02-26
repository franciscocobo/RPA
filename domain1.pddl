(define (domain dominio_p1)

(:requirements :strips :typing :negative-preconditions )

(:types

    enfermo ambulancia localizacion - object
)



(:predicates

    (ubicacion_ambulancia ?ambulancia - ambulancia ?localizacion - localizacion)
    (ubicacion_enfermo ?enfermo - enfermo ?localizacion - localizacion)
    (enlace ?localizacion1 ?localizacion2 - localizacion)
    (ambulancia_llena ?ambulancia - ambulancia ?enfermo - enfermo)
    (ambulancia_vacia ?ambulancia - ambulancia)
)


(:action conducir_vacia
    :parameters ( ?ambulancia - ambulancia ?localizacionOrigen ?localizacionDestino - localizacion)
    :precondition (and
        (ubicacion_ambulancia ?ambulancia ?localizacionOrigen)
        (enlace ?localizacionOrigen ?localizacionDestino)
        (ambulancia_vacia ?ambulancia)
    )
    :effect (and
        (ubicacion_ambulancia ?ambulancia ?localizacionDestino)
        (not (ubicacion_ambulancia ?ambulancia ?localizacionOrigen))
    )
)

(:action conducir_llena
    :parameters ( ?ambulancia - ambulancia ?localizacionOrigen ?localizacionDestino - localizacion ?enfermo -enfermo)
    :precondition (and
        (ubicacion_ambulancia ?ambulancia ?localizacionOrigen)
        (enlace ?localizacionOrigen ?localizacionDestino)
        (ambulancia_llena ?ambulancia ?enfermo)
    )
    :effect (and
        (ubicacion_ambulancia ?ambulancia ?localizacionDestino)
        (not (ubicacion_ambulancia ?ambulancia ?localizacionOrigen))
    )
)

(:action Subir_enfermo
    :parameters (?ambulancia - ambulancia ?localizacion - localizacion ?enfermo - enfermo)
    :precondition (and
        (ubicacion_ambulancia ?ambulancia ?localizacion)
        (ubicacion_enfermo ?enfermo ?localizacion)
        (ambulancia_vacia ?ambulancia)
    )
    :effect (and
        (ambulancia_llena ?ambulancia ?enfermo)
        (not (ambulancia_vacia ?ambulancia))
        (not (ubicacion_enfermo ?enfermo ?localizacion))
    )
)

(:action Bajar_enfermo
    :parameters (?ambulancia - ambulancia ?localizacion - localizacion ?enfermo - enfermo)
    :precondition (and
        (ubicacion_ambulancia ?ambulancia ?localizacion)
        (ambulancia_llena ?ambulancia ?enfermo)
    )
    :effect (and
        (not (ambulancia_llena ?ambulancia ?enfermo))
        (ambulancia_vacia ?ambulancia)
        (ubicacion_enfermo ?enfermo ?localizacion)
    )
)

)
