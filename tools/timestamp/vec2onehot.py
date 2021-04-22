import numpy as np


def encode_one_hot(labels):
    classes = set(labels)
    classes_dict = {c: np.identity(len(classes))[i, :] for i, c in enumerate(classes)}
    labels_one_hot = np.array(list(map(classes_dict.get, labels)), dtype=np.int32)
    return labels_one_hot


class vec2onehot:
    varOP_sentence = []
    edgeOP_sentence = []
    nodeOP_sentence = []
    nodeAC_sentence = []
    node_sentence = []
    var_sentence = []
    sn_sentence = []
    varOP_vectors = {}
    edgeOP_vectors = {}
    nodeOP_vectors = {}
    nodeAC_vectors = {}
    node_vectors = {}
    var_vectors = {}
    sn_vectors = {}
    # map user-defined variables (internal state) to symbolic names (e.g.,“VAR1”, “VAR2”) in the one-to-one fashion.
    nodelist = ['NULL', 'N1', 'N2', 'N3', 'N4', 'N5', 'C1', 'C2', 'C3', 'C4', 'C5']
    # Edges (Variable-related, Program-related, Extension edge)
    edgeOPlist = ["NULL", "AC", 'AG', "IF", "GB", "WH", "FR", "RE", "AH", "RG", "IR", "IT"]
    # node call representation
    nodeOplist = ['NULL', "Normal", "Core", "CoreTime"]
    # this notation (SN) is to show the execution order
    snlist = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10']

    def __init__(self):
        for i in range(len(self.nodelist)):
            self.node_sentence.append(i + 1)
        for i in range(len(self.snlist)):
            self.sn_sentence.append(i + 1)
        for i in range(len(self.edgeOPlist)):
            self.edgeOP_sentence.append(i + 1)
        for i in range(len(self.nodeOplist)):
            self.nodeOP_sentence.append(i + 1)
        self.node_dict = dict(zip(self.nodelist, self.node_sentence))
        self.sn_dict = dict(zip(self.snlist, self.sn_sentence))
        self.edgOP_dict = dict(zip(self.edgeOPlist, self.edgeOP_sentence))
        self.nodeOP_dict = dict(zip(self.nodeOplist, self.nodeOP_sentence))
        self.sn2vec()
        self.node2vec()
        self.edgeOP2vec()
        self.nodeOP2vec()

    def output_vec(self, vectors):
        for node, vec in vectors.items():
            print("{} {}".format(node, ' '.join([str(x) for x in vec])))

    def node2vec(self):
        for word, index in self.node_dict.items():
            node_array = np.zeros(len(self.nodelist), dtype=int)
            self.node_vectors[word] = node_array
            self.node_vectors[word][index - 1] = 1.0

    def node2vecEmbedding(self, node):
        return self.node_vectors[node]

    def sn2vec(self):
        for word, index in self.sn_dict.items():
            node_array = np.zeros(len(self.snlist), dtype=int)
            self.sn_vectors[word] = node_array
            self.sn_vectors[word][index - 1] = 1.0

    def sn2vecEmbedding(self, sn):
        return self.sn_vectors[sn]

    def edgeOP2vec(self):
        for word, index in self.edgOP_dict.items():
            node_array = np.zeros(len(self.edgeOPlist), dtype=int)
            self.edgeOP_vectors[word] = node_array
            self.edgeOP_vectors[word][index - 1] = 1.0

    def edgeOP2vecEmbedding(self, edgeOP):
        return self.edgeOP_vectors[edgeOP]

    def varOP2vecEmbedding(self, varOP):
        return self.varOP_vectors[varOP]

    def nodeOP2vec(self):
        for word, index in self.nodeOP_dict.items():
            node_array = np.zeros(len(self.nodeOplist), dtype=int)
            self.nodeOP_vectors[word] = node_array
            self.nodeOP_vectors[word][index - 1] = 1.0

    def nodeOP2vecEmbedding(self, verOP):
        return self.nodeOP_vectors[verOP]

    def nodeAC2vecEmbedding(self, nodeAC):
        return self.nodeAC_vectors[nodeAC]
