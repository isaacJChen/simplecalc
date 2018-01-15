//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        if args.count == 3 && Int(args[1]) == nil {
            switch args[1] {
            case "+":
                return Int(args[0])! + Int(args[2])!
            case "-":
                return Int(args[0])! - Int(args[2])!
            case "*":
                return Int(args[0])! * Int(args[2])!
            case"/":
                return Int(args[0])! / Int(args[2])!
            default:
                //default is %
                //return Int(1)%Int(2)
                return getRemainder(args)
            }
        } else {
            switch args[args.count-1] {
            case "count":
                return args.count-1
            case "avg":
                return avg(args)
            default:
                //default is fact
                return fact(args)
                
            }
        }
    }
    
    private func avg(_ args: [String]) -> Int{
        if args.count < 2 {
            return 0
        }
        var counter = 0
        var sum: Int = 0
        while counter < args.count-1 {
            sum += Int(args[counter])!
            counter += 1
        }
        return sum/(args.count-1)
    }
    
    private func fact(_ args: [String]) -> Int{
        if args.count == 1 {
            return 0
        }
        var counter = Int(args[0])!
        var sum: Int = 1
        if counter == 1 || counter == 0 {
            return 1;
        }
        while counter > 1 {
            sum *= counter
            counter -= 1
        }
        return sum
    }
    
    private func getRemainder(_ args:[String]) -> Int {
        var numerator = Int(args[0])!
        let denominator = Int(args[2])!
        while (numerator >= denominator) {
            numerator -= denominator
        }
        return numerator
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

