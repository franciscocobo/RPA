(define (problem problema1) (:domain dominio_p1)
(:objects
    l1 l2 l3 l4 - localizacion
    a1 - ambulancia
    e1 e2 - enfermo
)

(:init
    (ubicacion_ambulancia a1 L1)
    (ubicacion_enfermo e1 L3)
    (ubicacion_enfermo e2 L4)
    (ambulancia_vacia a1)
    (enlace l1 l2)
    (enlace l2 l4)
    (enlace l4 l3)
    (enlace l2 l1)
    (enlace l4 l2)
    (enlace l3 l4)
)

(:goal (and
    (ubicacion_enfermo e1 L1)
    (ubicacion_enfermo e2 L1)
))

)
