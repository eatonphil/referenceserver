import atexit
import socket


def main():
    sock = socket.socket()
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, True)
    sock.bind(("", 15000))
    sock.listen(-1)

    atexit.register(lambda: sock.shutdown(socket.SHUT_RDWR))

    while True:
        conn, address = sock.accept()
        conn.settimeout(2)
        data = ""
        while True:
            try:
                _data = conn.recv(1024)
            except socket.timeout:
                break

            data += _data.decode("utf-8")

        conn.sendall("Hello world".encode("utf-8"))

        conn.close()


if __name__ == "__main__":
    main()
