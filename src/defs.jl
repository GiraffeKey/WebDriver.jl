using PyCall

wd = pyimport("selenium.webdriver")

struct Driver
    o::PyObject
end
PyObject(x::Driver) = x.o

for attr in [:session_id, :capabilities, :command_executor, :error_handler]
    @eval $attr(w::Driver) = w.o["$attr"]
end


struct WebElement
    o::PyObject
end
PyObject(x::WebElement) = x.o


export init_phantomjs, init_firefox, init_chrome, init_ie

init_phantomjs(args...) = Driver(wd.PhantomJS(args...))
init_firefox(args...) = Driver(wd.Firefox(args...))
init_chrome(args...) = Driver(wd.Chrome(args...))
init_ie(args...) = Driver(wd.Ie(args...))


struct ActionChain
    o::PyObject
end

ActionChain(x::Driver) = ActionChain(wd.ActionChains(x.o))

PyObject(x::ActionChain) = x.o
