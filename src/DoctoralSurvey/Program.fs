open System
open System.IO
open System.Net
open Suave
open Suave.Logging
open Logary
open DoctoralSurvey.App
open DoctoralSurvey.Logging

[<EntryPoint>]
let main [| port; staticFilesLocation |] = 
    
    let staticFileRoot = Path.GetFullPath(Environment.CurrentDirectory + staticFilesLocation)

    let config =
        { defaultConfig with
            bindings = [ HttpBinding.mk HTTP IPAddress.Loopback (uint16 port)]
            listenTimeout = TimeSpan.FromMilliseconds 3000.
            mimeTypesMap = mimeTypes
            logger = SuaveAdapter(logary.getLogger (PointName.ofSingle "Suave")) }

    let app = buildApp staticFileRoot
    startWebServer config app
    0 // return an integer exit code