import Foundation

// Greatest common divisor
func gcd(_ a: Int, _ b: Int) -> Int {
    return (a % b == 0) ? b : gcd(b, a%b)
}

func solution(_ w:Int, _ h:Int) -> Int64{
  return Int64(w * h - ( w + h - gcd(w, h)))
}
