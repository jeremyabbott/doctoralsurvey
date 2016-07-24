module DoctoralSurvey.Logging

open System
open System.IO
open Logary
open Logary.Configuration
open Logary.Targets

open DoctoralSurvey.LoggingUtilities

let path = System.Reflection.Assembly.GetExecutingAssembly().Location |> Path.GetDirectoryName
let logName = "suave"
// Configuration settings for text writer target
let textConf = 
    TextWriter.TextWriterConf.create(
        // The Happy log for std output
        Path.Combine(path, DateTime.UtcNow.ToString("yyyy-MM") + "-happy.log") |> File.AppendText,
        // The sad log for error output
        Path.Combine(path, DateTime.UtcNow.ToString("yyyy-MM") + "-sad.log") |> File.AppendText)
    
let textConf' = { textConf with flush = true }

let logary =
    withLogaryManager logName (
        withTargets [
            Console.create Console.empty (PointName.ofSingle("console"))
            Debugger.create Debugger.empty (PointName.ofSingle("debugger"))
            TextWriter.create textConf' (PointName.ofSingle("textwriter"))
        ] >>
        (*withMetrics [
            MetricConf.create (Duration.FromMilliseconds 3000L) (PointName.ofSingle "cpu") Sample.cpuTime
        ] >>*)
        withRules [
            Rule.createForTarget (PointName.ofSingle("console"))
            Rule.createForTarget (PointName.ofSingle("debugger"))
            Rule.createForTarget (PointName.ofSingle("textwriter"))
        ])
        |> Hopac.TopLevel.run

let logRequest s =
        log logName s