"use strict";angular.module("angularApp",["ngCookies","ngResource","ngSanitize","ngRoute","ngAnimate"]).config(["$routeProvider",function(a){a.when("/",{templateUrl:"views/main.html",controller:"MainCtrl"}).otherwise({redirectTo:"/"})}]),angular.module("angularApp").controller("MainCtrl",["$scope","$resource",function(a,b){a.show=!1,a.feeds=b("/api/feeds.json").query(),a.getClass=function(a){return a%4==0?"box-blue":a%3==0?"box-green":a%2==0?"box-green":"box-pink"}}]);