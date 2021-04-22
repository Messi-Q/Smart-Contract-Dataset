import numpy as np
import os
import json
from tools.delegatecall.vec2onehot import vec2onehot

dict_AC = {"NoLimit": 0, "OwnerLimit": 1}

dict_NodeName = {"NULL": 0, "N1": 1, "N2": 2, "N3": 3, "N4": 4, "N5": 5, "N6": 6, "N7": 7, "C1": 8, "C2": 9, "C3": 10,
                 "C4": 11}

dict_EdgeOpName = {"NULL": 0, "AC": 1, 'AG': 2, "IF": 3, "GB": 4, "WH": 5, "FR": 6, "RE": 7, "AH": 8, "RG": 9, "IR": 10,
                   "IT": 11, "DI": 12}

dict_NodeOpName = {"Normal": 0, "NormalOwner": 1, "Core": 2, "CoreDelegate": 3, "CoreInternal": 4, "CoreExternal": 5,
                   "CoreAddressVA": 6, "CoreAddress": 7}

v2o = vec2onehot()  # create the one-bot dicts


# extract the features of each node from input file
def extract_node_features(nodeFile):
    nodeNum = 0
    node_list = []
    node_attribute_list = []
    f = open(nodeFile)
    lines = f.readlines()
    f.close()
    for line in lines:
        node = list(map(str, line.split()))
        verExist = False
        for i in range(0, len(node_list)):
            if node[1] == node_list[i]:
                verExist = True
            else:
                continue
        if verExist is False:
            node_list.append(node[1])
            nodeNum += 1
        node_attribute_list.append(node)
    return nodeNum, node_list, node_attribute_list


# extract the features of each edge from input file
def extract_edge_feature(edgeFile):
    # eliminate edge
    edge_list = []  # all edge

    f = open(edgeFile)
    lines = f.readlines()
    f.close()

    for line in lines:
        edge = list(map(str, line.split()))
        edge_list.append(edge)

    return edge_list


def embedding_node(node_attribute_list):
    # embedding each node after elimination
    node_encode = []
    node_embedding = []
    node_vec = []
    main_point = ['N1', 'N2', 'N3', 'N4', 'N5', 'N6', 'N7', 'C1', 'C2', 'C3', 'C4']

    for j in range(0, len(node_attribute_list)):
        tmp_vf = 0
        tmp_vfm = 0
        v = node_attribute_list[j][0]
        if v in main_point:
            vf0 = node_attribute_list[j][0]
            vf1 = dict_NodeName[node_attribute_list[j][1]]
            vfm1 = v2o.node2vecEmbedding(node_attribute_list[j][1])
            vf2 = dict_AC[node_attribute_list[j][2]]
            vfm2 = v2o.nodeAC2vecEmbedding(node_attribute_list[j][2])
            result = node_attribute_list[j][3].split(",")

            if (len(result)) > 1:
                for call_vec in range(len(result)):
                    if call_vec != (len(result) - 1):
                        if call_vec != 0:
                            tmp_vf = str(tmp_vf) + str(dict_NodeName[result[call_vec]]) + ","
                        else:
                            tmp_vf = str(dict_NodeName[result[call_vec]]) + ","
                    else:
                        tmp_vf = str(tmp_vf) + str(dict_NodeName[result[call_vec]])
                    tmp_vfm += np.array(list(v2o.node2vecEmbedding(result[call_vec])))

            elif len(result) == 1:
                tmp_vf = dict_NodeName[result[0]]
                tmp_vfm = v2o.node2vecEmbedding(result[0])

            vf3 = tmp_vf
            vfm3 = tmp_vfm
            vf4 = int(node_attribute_list[j][4])
            vfm4 = v2o.sn2vecEmbedding(node_attribute_list[j][4])
            vf5 = dict_NodeOpName[node_attribute_list[j][5]]
            vfm5 = v2o.nodeOP2vecEmbedding(node_attribute_list[j][5])
            nodeEmbedding = vfm1.tolist() + vfm2.tolist() + vfm3.tolist() + vfm4.tolist() + vfm5.tolist()
            node_embedding.append([vf0, np.array(nodeEmbedding)])
            temp = [vf1, vf2, vf3, vf4, vf5]

            node_encode.append([vf0, temp])
            node_embedding_dim_without_edge = 64
            vec = np.zeros(node_embedding_dim_without_edge, dtype=int)

            for i in range(len(node_embedding)):
                node_feature = node_embedding[i][1].tolist()
                vec[0:len(np.array(node_feature))] = np.array(node_feature)
            node_vec.append([vf0, vec])

    return node_encode, node_embedding, node_vec


def embedding_edge(edge_list):
    edge_embedding = []
    node_list = []
    edge_order = []
    dict_node = {}
    count = 0
    for i in range(len(edge_list)):
        if edge_list[i][0] not in node_list:
            node_list.append(edge_list[i][0])
            print(node_list)
            dict_node[edge_list[i][0]] = count
            count = count + 1
        if edge_list[i][1] not in node_list:
            node_list.append(edge_list[i][1])
            dict_node[edge_list[i][1]] = count
            count = count + 1
    for k in range(len(edge_list)):
        start = edge_list[k][0]  # start node
        end = edge_list[k][1]  # end node
        b, c = edge_list[k][2], edge_list[k][3]  # order, type
        efstart = dict_node[start]
        efend = dict_node[end]
        efc = dict_EdgeOpName[c]
        edge_embedding.append([efstart, efc, efend])
        edge_order.append(b)

    return edge_embedding, edge_order


if __name__ == "__main__":
    node = "../../delegatecall/source_graph_data/nodes/317.sol"
    edge = "../../delegatecall/source_graph_data/edges/317.sol"
    nodeNum, node_list, node_attribute_list = extract_node_features(node)
    node_encode, node_embedding, node_vec = embedding_node(node_attribute_list)
    edge_list = extract_edge_feature(edge)
    edge_embedding, edge_order = embedding_edge(edge_list)
    print(node_embedding)
    print(edge_embedding)
    print(edge_order)

    v_path = "../../delegatecall/source_graph_data/nodes"
    e_path = "../../delegatecall/source_graph_data/edges"

    fullnodes_ouptput_tmp = open('./results/Delegatecall_AutoExtract_fullnodes.json', 'w')
    fullnodes_ouptput_gcn = open('./results/Delegatecall_AutoExtract_fullnodes.txt', 'a')
    contract_name = open("../../delegatecall/final_delegatecall_name.txt")  # contracts list
    contract_label = open("../../delegatecall/final_delegatecall_label.txt")  # contracts label
    names = contract_name.readline().strip(" ")
    labels = contract_label.readline()

    while names:
        node = os.path.join(v_path, names.strip('\n'))
        edge = os.path.join(e_path, names.strip('\n'))
        print(node)

        nodeNum, node_list, node_attribute_list = extract_node_features(node)
        node_encode, node_embedding, node_vec = embedding_node(node_attribute_list)
        edge_list = extract_edge_feature(edge)
        edge_embedding, edge_order = embedding_edge(edge_list)

        graph_edge = []
        for i in edge_embedding:
            graph_edge.append(i)

        fullnodes_ouptput_gcn.write(names)

        for k in range(len(node_vec)):
            node_vec[k][1].astype(np.float64)
            node_vec[k][1] = node_vec[k][1].tolist()
            fullnodes_ouptput_gcn.write(str(node_vec[k][0]) + ":" + str(node_vec[k][1]) + '\n')

        fullnodes_feature_list = []
        for i in range(len(node_vec)):
            print(node_embedding)
            fullnodes_feature_list.append(node_vec[i][1])

        edge_dict = {
            "graph": graph_edge
        }

        fullnode_graph_dict = ({
            "targets": labels.strip('\n'),
            "graph": graph_edge,  # graph_edge,
            "contract_name": names.strip('\n'),
            "node_features": fullnodes_feature_list,  # corenodes_feature_list
        })

        fullnodes_result = json.dumps(fullnode_graph_dict)
        fullnodes_ouptput_tmp.write(fullnodes_result + "," + "\n")
        names = contract_name.readline()
        labels = contract_label.readline()

    fullnodes_ouptput_gcn.close()
    fullnodes_ouptput_tmp.close()
