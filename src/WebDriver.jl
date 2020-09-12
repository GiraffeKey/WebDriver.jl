module WebDriver

using PyCall

import Base: size, close, parent, get

include("defs.jl")
include("generated.jl")

end # module
