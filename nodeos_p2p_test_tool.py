import socket
import sys

def test_p2p_addresses(filename):
    with open(filename, 'r') as f:
        p2p_addresses = []
        
        for line in f:
            if not line.startswith('#'):
                line = line.replace('p2p-peer-address = ', '')
                p2p_addresses.append(line.rstrip())
                
    for p2p_address in p2p_addresses:
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

if __name__ == '__main__':
    filename = sys.argv[1]
    test_p2p_addresses(filename)

