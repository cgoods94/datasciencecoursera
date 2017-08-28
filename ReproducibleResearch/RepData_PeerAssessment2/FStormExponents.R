FStormExponents <- function( damage, exp )
{
    exp <- switch( exp,
            h = 1e2,
            H = 1e2,
            K = 1e3,
            M = 1e6,
            m = 1e6,
            B = 1e9,
            '0' = 1,
            '1' = 1e1,
            '2' = 1e2,
            '3' = 1e3,
            '4' = 1e4,
            '5' = 1e5,
            '6' = 1e6,
            '7' = 1e7,
            '8' = 1e8,
            1)
    damage * exp
}