extends Node2D

var tsknum:float = 0
var tskscomp:int = 0
var icon:String = "1"
var savename:String
var saveicon:String
var saveiconcolor:int
var color:String
var acttext:String
var iconsel:bool =false
var comptask:bool = false
var comptaskid:int
var saving:bool = false
var targettask:int
var save:bool = false
var newday:bool = false
var devmode:bool = false #Devmode Enabled?
var beta:bool = false #Beta Enabled?
var conopen= false
var nowsaving:bool #Is Saving?
var savepass:bool #Main Task Saved, Passing To Done Task

var edit:bool = false
var edittarget:int 
var editname:String
var editicon:String
var editcolor:String

var taskDB = {1:0,2:0,3:0,4:0,5:0,6:0,7:0,8:0,9:0,10:0} #Active Tasks
var taskCP = {1:0,2:0,3:0,4:0,5:0,6:0,7:0,8:0,9:0,10:0} #Completed Tasks


