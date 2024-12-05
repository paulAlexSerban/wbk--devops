import tornado.web
import tornado.ioloop

class BasicRequestHandler(tornado.web.RequestHandler):
    def get(self):
        self.write("Hello, world")

class ListRequestHandler(tornado.web.RequestHandler):
    def get(self):
        self.render('index.html')

if __name__ == '__main__':
    app = tornado.web.Application([
        (r"/", BasicRequestHandler),
        (r"/animal", ListRequestHandler),
    ])
    port = 5000
    app.listen(port)
    print(f"I'm listening on port {port}")
    tornado.ioloop.IOLoop.current().start()