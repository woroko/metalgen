import sys

import numpy
import h5py
import theano

from theanolm import Vocabulary, Architecture, Network, TextSampler
from theanolm.filetypes import TextFileType

class Sampler:

    def __init__(self, model_path):
        self.model_path = model_path
        numpy.random.seed()
        theano.config.compute_test_value = 'off'

        with h5py.File(model_path, 'r') as self.state:
            print("Reading vocabulary from network state.")
            #sys.stdout.flush()
            self.vocabulary = Vocabulary.from_state(self.state)
            print("Number of words in vocabulary:", self.vocabulary.num_words())
            print("Number of words in shortlist:", self.vocabulary.num_shortlist_words())
            print("Number of word classes:", self.vocabulary.num_classes())
            print("Building neural network.")
            #sys.stdout.flush()
            self.architecture = Architecture.from_state(self.state)
            self.network = Network(self.architecture, self.vocabulary, mode=Network.Mode(minibatch=False))
            print("Restoring neural network state.")
            self.network.set_state(self.state)

        print("Building text sampler.")
        #sys.stdout.flush()
        self.sampler = TextSampler(self.network)

    def sample(self, sen_len, sen_num):
        sequences = self.sampler.generate(sen_len, sen_num)
        ret = ""
        seqnum = 0
        for sequence in sequences:
            try:
                eos_pos = sequence.index('</s>')
                sequence = sequence[:eos_pos+1]
            except ValueError:
                pass
            except TypeError:
                pass

            if (len(sequence) < 4):
                continue

            ret = ret + ' '.join(sequence)
            if (seqnum == 0):
                ret = "<div class=\"col-md-4\">\n" + ret
            elif (seqnum % 2 == 0):
                ret = ret + "\n</div><div class=\"col-md-4\">\n"

            seqnum = seqnum + 1

        return ret + "\n<div>\n"
