let socket = Unix.socket Unix.PF_INET Unix.SOCK_STREAM 0;;
let addr = Unix.ADDR_INET(Unix.inet_addr_any, 15000);;
let _ = Unix.setsockopt socket Unix.SO_REUSEADDR true;;
let _ = Unix.bind socket addr;;
let _ = Unix.listen socket 10;;
let bytes = Bytes.create 1024;;

let rec loop () =
    let new_socket, _ = Unix.accept socket in
    let nread = Unix.recv new_socket bytes 0 1024 [] in
    Printf.printf "%s\n%!" (Bytes.to_string (Bytes.sub bytes 0 nread));
    let _ = Unix.send new_socket (Bytes.of_string "hello world\n") 0 12 [] in
    Unix.close new_socket; loop (); ()
    in loop ();;
  
Unix.close socket
