import socket

def test_p2p_address(p2p_address):
    
    address, port = p2p_address.split(':')
    port = int(port)

    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    try:
  
        result = sock.connect_ex((address, port))
        if result == 0:
            print(f'{p2p_address} is reachable')
        else:
            print(f'{p2p_address} is not reachable')
    except socket.error as e:
        print(f'Error: {e}')

 
    sock.close()

p2p_address = input('Enter P2P address: ')
test_p2p_address(p2p_address)
