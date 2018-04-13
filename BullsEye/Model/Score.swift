enum PerfectionLevel: String {
  case perfect = "Perfect!"
  case almost = "You almost had it!"
  case good = "Pretty good!"
  case bad = "Not even close..."
}

struct Score {
  let score: Int
  let perfection: PerfectionLevel
}
