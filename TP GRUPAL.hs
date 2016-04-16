data Archivo = Archivo { nombre :: String, contenido :: String } deriving (Read, Show, Eq)

archivoPrueba1 :: Archivo
archivoPrueba1 = Archivo "Ejemplo" "Trabajo practico de Paradigmas\n\t \f \r \v \nNombre del TP HIT" 

archivoPrueba2 :: Archivo
archivoPrueba2 = Archivo "Ejemplo.hs" "" --Archivo vacio

archivoPrueba3 :: Archivo
archivoPrueba3 = Archivo "Ejemplo3.hs" "TP: Paradigmas\nEste texto esta en la segunda linea \nParadigmas"

archivoPrueba4 :: Archivo
archivoPrueba4 = Archivo "Ejemplo4.hs" "TP: Paradigmas\nEste texto esta en la segunda linea \nParadigmas"

isSpace caracter = (==) caracter ' ' || (==) caracter '\n' || (==) caracter '\t' || (==) caracter '\r' || (==) caracter '\f' || (==) caracter '\v'

--OPERACIONES BASICAS SOBRE ARCHIVOS

--Punto 1)
dameTamañoDelArchivo :: Archivo -> Int
dameTamañoDelArchivo (Archivo _ contenido) =  (*8)(length (contenido))

--Punto2)
archivoVacio :: Archivo -> Bool
archivoVacio (Archivo _ contenido) =  (==0) (length (contenido))

--Punto3) 
dameCantidadDeLineas :: Archivo -> Int
dameCantidadDeLineas (Archivo _ contenido) = (length.(filter (=='\n'))) contenido

--Punto4)
algunaLineaBlanca :: Archivo -> Bool
algunaLineaBlanca (Archivo _ contenido ) =  any (==True) (map (all isSpace) (lines contenido))

--Punto5)
esDeExtencionHS :: Archivo -> Bool
esDeExtencionHS (Archivo nombre _ ) = ((=="sh.").(take 3).reverse) nombre

--MODIFICACIONES SOBRE ARCHIVOS

--Punto6) 
renombrarArchivo :: Archivo -> String -> Archivo
renombrarArchivo (Archivo _ contenido ) nombreNuevo = (Archivo nombreNuevo contenido)

--Punto7)
agregarNuevaLinea :: Int -> String -> Archivo -> Archivo
agregarNuevaLinea numeroDeLinea contenidoAAgregar (Archivo nombre contenido) =(Archivo nombre (unlines (take numeroDeLinea (lines contenido)) ++ contenidoAAgregar ++ "\n" ++ (unlines (drop numeroDeLinea (lines contenido)))))

--convertirAUnSoloString listaDeStrings = foldl1 (\ palabra1 palabra2 -> palabra1 ++ " " ++ palabra2) listaDeStrings 

--Punto8)
quitarUnaLinea :: Int -> Archivo -> Archivo
quitarUnaLinea numeroDeLinea (Archivo nombre contenido) = (Archivo nombre ((unlines (take (numeroDeLinea-1) (lines contenido))) ++ (unlines (drop numeroDeLinea (lines contenido))))) 

--Punto9) 
reemplazarUnaLinea :: Int -> String -> Archivo -> Archivo
reemplazarUnaLinea  numeroDeLinea  contenidoAAgregar (Archivo nombre contenido) = (Archivo nombre ((unlines (take (numeroDeLinea-1) (lines contenido))) ++ contenidoAAgregar ++ "\n" ++ (unlines (drop numeroDeLinea (lines contenido))))) 

--Punto10)
buscarYReemplazar palabraAReemplazar palabraNueva (Archivo nombre contenido) = (Archivo nombre (unlines (map unwords (map (map (reemplazarPalabra palabraNueva palabraAReemplazar)) (map words (lines contenido))))))

reemplazarPalabra palabraNueva palabraAReemplazar palabraActual 
 | palabraAReemplazar == palabraActual = palabraNueva
 | otherwise = palabraActual
 
--Punto11)
--wrappearLasLineas (Archivo nombre contenido) = lines (map (recursivaTake) (lines contenido)) 

--recursivaTake linea
-- | linea.length <= 80 = linea
-- | otherwise = lines ((take 80 linea) ++ "\n" ++ (drop 80 linea))
										 
wrappearLasLineasVersionSanti (Archivo nombre contenido) = Archivo nombre (unlines (map (funcionPrueba) (lines contenido)))	
funcionPrueba linea 
	|length linea <= 80 = linea
	|otherwise = (take 80 linea) ++ "\n" ++ (funcionPrueba (drop 80 linea))
 
--Punto12)
modificacionInutil funcionModificacion (Archivo nombre contenido) = dameNombre (funcionModificacion (Archivo nombre contenido)) == nombre && words (dameContenido (funcionModificacion (Archivo nombre contenido))) == words contenido
dameNombre (Archivo nombre contenido) = nombre
dameContenido (Archivo nombre contenido) = contenido

-- REVISIONES DE UN ARCHIVO
--Punto13)
revision listaDeFunciones = map ((Archivo nombre contenido)$) listaDeFunciones
aplicarFuncionYConcatenar listaFunciones Archivo nombre contenido)
	| length listaDeFunciones =/ 0 = 


