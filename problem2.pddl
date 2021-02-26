(define (problem problema2) (:domain dominio_p2)
(:objects
    h l1 l2 l3 - localizacion
    a1 - ambulancia
    e1 e2 - enfermo
)

(:init
    (ubicacion_ambulancia a1 L1)
    (ubicacion_enfermo e1 L2)
    (ubicacion_enfermo e2 L3)
    (ambulancia_vacia a1)
    (enlace H l1)
    (enlace l1 l2)
    (enlace l2 l3)
    (enlace l3 H)
    (enlace H l3)
)

(:goal (and
    (ubicacion_enfermo e1 H)
    (ubicacion_enfermo e2 H)
))

)
