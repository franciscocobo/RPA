(define (domain dominio_p1)

(:requirements :strips :typing :negative-preconditions )

(:types

    enfermo ambulancia localizacion - object
)



(:predicates

    (ubicacion_ambulancia ?ambulancia - ambulancia ?localizacion - localizacion)
    (ubicacion_enfermo ?enfermo - enfermo ?localizacion - localizacion)
    (enlace ?localizacion1 ?localizacion2 - localizacion)
    (ambulancia_llena ?ambulancia - ambulancia ?enfermo1 ?enfermo2 - enfermo)
    (ambulancia_semi_llena ?ambulancia - ambulancia ?enfermo - enfermo)
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
    :parameters ( ?ambulancia - ambulancia ?localizacionOrigen ?localizacionDestino - localizacion ?enfermo1 ?enfermo2 - enfermo)
    :precondition (and
        (ubicacion_ambulancia ?ambulancia ?localizacionOrigen)
        (enlace ?localizacionOrigen ?localizacionDestino)
        (ambulancia_llena ?ambulancia ?enfermo1 ?enfermo2)
    )
    :effect (and
        (ubicacion_ambulancia ?ambulancia ?localizacionDestino)
        (not (ubicacion_ambulancia ?ambulancia ?localizacionOrigen))
    )
)

(:action conducir_semi_llena
    :parameters ( ?ambulancia - ambulancia ?localizacionOrigen ?localizacionDestino - localizacion ?enfermo - enfermo)
    :precondition (and
        (ubicacion_ambulancia ?ambulancia ?localizacionOrigen)
        (enlace ?localizacionOrigen ?localizacionDestino)
        (ambulancia_semi_llena ?ambulancia ?enfermo)
    )
    :effect (and
        (ubicacion_ambulancia ?ambulancia ?localizacionDestino)
        (not (ubicacion_ambulancia ?ambulancia ?localizacionOrigen))
    )
)

(:action Subir_primer_enfermo
    :parameters (?ambulancia - ambulancia ?localizacion - localizacion ?enfermo - enfermo)
    :precondition (and
        (ubicacion_ambulancia ?ambulancia ?localizacion)
        (ubicacion_enfermo ?enfermo ?localizacion)
        (ambulancia_vacia ?ambulancia)
    )
    :effect (and
        (ambulancia_semi_llena ?ambulancia ?enfermo)
        (not (ambulancia_vacia ?ambulancia))
        (not (ubicacion_enfermo ?enfermo ?localizacion))
    )
)

(:action Subir_segundo_enfermo
    :parameters (?ambulancia - ambulancia ?localizacion - localizacion ?enfermo1 ?enfermo2 - enfermo)
    :precondition (and
        (ubicacion_ambulancia ?ambulancia ?localizacion)
        (ubicacion_enfermo ?enfermo1 ?localizacion)
        (ubicacion_enfermo ?enfermo2 ?localizacion)
        (ambulancia_semi_llena ?ambulancia ?enfermo1)
    )
    :effect (and
        (ambulancia_llena ?ambulancia ?enfermo1 ?enfermo2)
        (not (ambulancia_semi_llena ?ambulancia ?enfermo1))
        (not (ubicacion_enfermo ?enfermo2 ?localizacion))
    )
)

(:action Bajar_1_enfermo
    :parameters (?ambulancia - ambulancia ?localizacion - localizacion ?enfermo - enfermo)
    :precondition (and
        (ubicacion_ambulancia ?ambulancia ?localizacion)
        (ambulancia_semi_llena ?ambulancia ?enfermo)
    )
    :effect (and
        (not (ambulancia_semi_llena ?ambulancia ?enfermo))
        (ambulancia_vacia ?ambulancia)
        (ubicacion_enfermo ?enfermo ?localizacion)
    )
)

(:action Bajar_2_enfermo
    :parameters (?ambulancia - ambulancia ?localizacion - localizacion ?enfermo1 ?enfermo2 - enfermo)
    :precondition (and
        (ubicacion_ambulancia ?ambulancia ?localizacion)
        (ambulancia_llena ?ambulancia ?enfermo1 ?enfermo2)
    )
    :effect (and
        (not (ambulancia_llena ?ambulancia ?enfermo1 ?enfermo2))
        (ambulancia_vacia ?ambulancia)
        (ubicacion_enfermo ?enfermo1 ?localizacion)
        (ubicacion_enfermo ?enfermo2 ?localizacion)
    )
)

)
