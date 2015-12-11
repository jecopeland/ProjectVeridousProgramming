package com.nmefermmmtools.utils;
import nme.Lib;

class Chronometer 
{
	public var countdownMode		:Bool;
	private var time				:Float;
	private var tempTimeCalculation	:Float;
	private var startingMiliseconds	:Float;
	private var running				:Bool;
	
	public function new(autoStart:Bool = true) 
	{
		running = false;
		if (autoStart)
			start();
	}
	
	public function start(startingMiliseconds:Int = 0, countdownMode:Bool = false):Void
	{
		this.countdownMode 			= countdownMode;
		this.startingMiliseconds 	= startingMiliseconds;
		time 						= Lib.getTimer();
		running						= true;
	}
	
	public function getTotalMilliseconds():Float
	{
		if (running)
		{
			if(!countdownMode)
				tempTimeCalculation = Lib.getTimer() - time + startingMiliseconds;
			else
				tempTimeCalculation = -(Lib.getTimer() - time - startingMiliseconds);
			
			if(tempTimeCalculation > 0)
				return tempTimeCalculation;
			else
				return 0;
		}
		else
		{	
			return 0;
		}
	}
	
	public static function getTotalSeconds(totalMilliseconds:Float):Float
	{
		return Math.floor(totalMilliseconds / 1000);
	}
	
	public static function getTotalMinutes(totalMilliseconds:Float):Float
	{
		return Math.floor(getTotalSeconds(totalMilliseconds) / 60);
	}
	
	public static function getTotalHours(totalMilliseconds:Float):Float
	{
		return Math.floor(getTotalMinutes(totalMilliseconds) / 60);
	}
	
	public static function getMilliseconds(totalMilliseconds:Float):String
	{
		return zero100Format(Math.floor(totalMilliseconds - getTotalSeconds(totalMilliseconds) * 1000));
	}
	
	public static function getSeconds(totalMilliseconds:Float):String
	{
		return zero10Format(Math.floor(getTotalSeconds(totalMilliseconds) - getTotalMinutes(totalMilliseconds) * 60));
	}
	
	public static function getMinutes(totalMilliseconds:Float):String
	{
		return  zero10Format(Math.floor(getTotalMinutes(totalMilliseconds) - getTotalHours(totalMilliseconds) * 60));
	}
	
	public static function getHHMMSSMMM(totalMilliseconds:Float):String
	{
		return getTotalHours(totalMilliseconds) + ":" + getMinutes(totalMilliseconds) + ":" + getSeconds(totalMilliseconds) + ":" + getMilliseconds(totalMilliseconds);
	}
	
	public static function getHHMMSS(totalMilliseconds:Float):String
	{
		return getTotalHours(totalMilliseconds) + ":" + getMinutes(totalMilliseconds) + ":" + getSeconds(totalMilliseconds);
	}
	
	public static function getMMSSMMM(totalMilliseconds:Float):String
	{
		return getMinutes(totalMilliseconds) + ":" + getSeconds(totalMilliseconds) + ":" + getMilliseconds(totalMilliseconds);
	}
	
	public static function getMMSS(totalMilliseconds:Float):String
	{
		return getMinutes(totalMilliseconds) + ":" + getSeconds(totalMilliseconds);
	}
	
	public static function getSSMMM(totalMilliseconds:Float):String
	{
		return getSeconds(totalMilliseconds) + ":" + getMilliseconds(totalMilliseconds);
	}
	
	/**
	 * adds 0 before a < 10 number, example: 01 02 03 04 05 06 07 08 09 10 11 12
	 * 
	 * @param	number
	 * @return
	 */
	private static function zero10Format(number:Float):String
	{
		if (number < 10)
			return cast ("0" + number);
		else
			return cast number;
	}
	
	/**
	 * adds 0 before a < 100 number and 00 before < 10 number, example: 001 002 003 004 005 006 007 008 009 010 011 012 100 110 120 200 250
	 * 
	 * @param	number
	 * @return
	 */
	private static function zero100Format(number:Float):String
	{
		if (number < 10)
			return cast ("00" + number);
		else if(number < 100)
			return cast ("0" + number);
		else
			return cast number;
	}
}