// Raisable+Values.swift
// NumericProtocols
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Raisable
where Self: ExpressibleByIntegerLiteral {
	
	// MARK: - Other Values
	
    /// The value representing one vigintillion.
    public static var vigintillion: Self {
		return 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000
    }
    
    /// The value representing one novemdecillion.
    public static var novemdecillion: Self {
		return 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000
    }
    
    /// The value representing one octodecillion.
    public static var octodecillion: Self {
		return 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000
    }
    
    /// The value representing one septendecillion.
    public static var septendecillion: Self {
		return 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000
    }
    
    /// The value representing one sexdecillion.
    public static var sexdecillion: Self {
		return 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000
    }
    
    /// The value representing one quindecillion.
    public static var quindecillion: Self {
		return 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000
    }
    
    /// The value representing one quatttuordecillion.
    public static var quatttuordecillion: Self {
		return 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000_000
    }
    
    /// The value representing one tredecillion.
    public static var tredecillion: Self {
		return 1_000_000_000_000_000_000_000_000_000_000_000_000_000_000
    }
    
    /// The value representing one duodecillion.
    public static var duodecillion: Self {
		return 1_000_000_000_000_000_000_000_000_000_000_000_000_000
    }
    
    /// The value representing one undecillion.
    public static var undecillion: Self {
		return 1_000_000_000_000_000_000_000_000_000_000_000_000
    }
    
    /// The value representing one decillion.
    public static var decillion: Self {
		return 1_000_000_000_000_000_000_000_000_000_000_000
    }
    
    /// The value representing one nonillion.
    public static var nonillion: Self {
		return 1_000_000_000_000_000_000_000_000_000_000
    }
    
    /// The value representing one octillion.
    public static var octillion: Self {
		return 1_000_000_000_000_000_000_000_000_000
    }
    
    /// The value representing one septillion.
    public static var septillion: Self {
		return 1_000_000_000_000_000_000_000_000
    }
    
    /// The value representing one sextillion.
    public static var sextillion: Self {
		return 1_000_000_000_000_000_000_000
    }
    
    /// The value representing one quintillion.
    public static var quintillion: Self {
		return 1_000_000_000_000_000_000
    }
    
    /// The value representing one quadrillion.
    public static var quadrillion: Self {
		return 1_000_000_000_000_000
    }
    
    /// The value representing one trillion.
    public static var trillion: Self {
		return 1_000_000_000_000
    }
    
    /// The value representing one billion.
    public static var billion: Self {
		return 1_000_000_000
    }
    
    /// The value representing one million.
    public static var million: Self {
		return 1_000_000
    }
    
    /// The value representing one hundred thousand.
    public static var hundredThousand: Self {
		return 100_000
    }
    
    /// The value representing one thousand.
    public static var tenThousand: Self {
		return 10_000
    }
    
    /// The value representing one thousand.
    public static var thousand: Self {
		return 1_000
    }
    
    /// The value representing one hundred.
    public static var hundred: Self {
		return 100
    }
    
    /// The value representing ten.
    public static var ten: Self {
		return 10
    }
    
    /// The value representing one.
    public static var one: Self {
        return 1
    }
}
