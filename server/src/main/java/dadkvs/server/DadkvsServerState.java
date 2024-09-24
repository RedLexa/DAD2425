package dadkvs.server;
import dadkvs.DadkvsMain;
import dadkvs.DadkvsMainServiceGrpc;
import java.util.HashMap;
import dadkvs.DadkvsPaxos;
import java.util.Map;
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
    Map<Integer, DadkvsMain.CommitRequest> request_list;
    Map<Integer, StreamObserver<DadkvsMain.CommitReply>> responseObserver;

    Map<Integer, TransactionRecord> transactions_commited;

    Map<Integer,StreamObserver<DadkvsPaxos.PhaseTwoReply>> phase2Observer;

    int next_req = 1;


    
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
        transactions_commited = new HashMap<Integer, TransactionRecord>();
        phase2Observer = new HashMap<Integer,StreamObserver<DadkvsPaxos.PhaseTwoReply>>();
    }
}
