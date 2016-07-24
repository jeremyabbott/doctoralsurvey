module DoctoralSurvey.LoggingUtilities

open System.IO
open Logary

let deleteIfExists path =
    if File.Exists path then
        File.Delete path

let log name text =
    let namedLogger = Logging.getLoggerByName name
    let writeLog x = Logary.Logger.log namedLogger x |> Hopac.TopLevel.start

    Logary.Message.eventInfo text |> writeLog