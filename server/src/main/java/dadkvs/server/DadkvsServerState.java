package dadkvs.server;

import java.util.HashMap;
import java.util.Map;
import dadkvs.DadkvsMain;
import dadkvs.DadkvsPaxos;
import dadkvs.DadkvsMainServiceGrpc;

import io.grpc.stub.StreamObserver;

public class DadkvsServerState {
    boolean        i_am_leader;
    int            debug_mode;
    int            base_port;
    int            my_id;
    int            store_size;
    KeyValueStore  store;
    MainLoop       main_loop;
    Thread         main_loop_worker;
    int req_to_propose;
    int next_req = 1;
    int               timestamp;
     Map<Integer, DadkvsMain.CommitRequest> request_list;
     Map<Integer, Integer> agreed_indexes; 
    Map<Integer, StreamObserver<DadkvsMain.CommitReply>> responseObserver;

    
    public DadkvsServerState(int kv_size, int port, int myself) {
	base_port = port;
	my_id = myself;
	i_am_leader = false;
	debug_mode = 0;
	store_size = kv_size;
	store = new KeyValueStore(kv_size);
	main_loop = new MainLoop(this);
	main_loop_worker = new Thread (main_loop);
	main_loop_worker.start();
    request_list = new HashMap<Integer,DadkvsMain.CommitRequest>();
    responseObserver = new HashMap<Integer,StreamObserver<DadkvsMain.CommitReply>>();
    agreed_indexes = new HashMap<Integer,Integer>();
    req_to_propose = -1;
    timestamp = 0;
    }
}
