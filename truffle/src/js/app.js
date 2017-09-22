App = {
    web3Provider: null,
    contracts: {},

    init: function() {
        // Load veggies.
        $.getJSON('../veggies.json', function(data) {
            var veggiesRow = $('#veggiesRow');
            var veggieTemplate = $('#veggieTemplate');

            for (i = 0; i < data.length; i ++) {
                veggieTemplate.find('.panel-title').text(data[i].name);
                veggieTemplate.find('img').attr('src', data[i].picture);
                veggieTemplate.find('.veggie-breed').text(data[i].breed);
                veggieTemplate.find('.veggie-cost').text(data[i].cost);
                veggieTemplate.find('.veggie-origin').text(data[i].origin);
                veggieTemplate.find('.btn-buy').attr('data-id', data[i].id);

                veggiesRow.append(veggieTemplate.html());
            }
        });

        return App.initWeb3();
    },

    initWeb3: function() {
        // Is there is an injected web3 instance?
        if (typeof web3 !== 'undefined') {
            App.web3Provider = web3.currentProvider;
            web3 = new Web3(web3.currentProvider);
        } else {
            /*
            If no injected web3 instance is present,
            we create our web3 object based on the TestRPC's provider.
            Note this fallback is fine for development environments,
            but insecure and not suitable for production.
            */
            App.web3Provider = new web3.providers.HttpProvider('http://localhost:8545');
            web3 = new Web3(App.web3Provider);
        }

        return App.initContract();
    },

    initContract: function() {
        $.getJSON('Adoption.json', function(data) {
            // Get the necessary contract artifact file and instantiate it with truffle-contract.
            var AdoptionArtifact = data;
            App.contracts.Adoption = TruffleContract(AdoptionArtifact);

            // Set the provider for our contract.
            App.contracts.Adoption.setProvider(App.web3Provider);

            // Use our contract to retieve and mark the adopted veggies.
            return App.markAdopted();
        });

        return App.bindEvents();
    },

    bindEvents: function() {
        $(document).on('click', '.btn-buy', App.handleAdopt);
    },

    handleAdopt: function() {
        event.preventDefault();

        var veggieId = parseInt($(event.target).data('id'));

        var adoptionInstance;

        web3.eth.getAccounts(function(error, accounts) {
            if (error) {
                console.log(error);
            }

            var account = accounts[0];

            App.contracts.Adoption.deployed().then(function(instance) {
                adoptionInstance = instance;

                return adoptionInstance.adopt(veggieId, {from: account});
            }).then(function(result) {
                return App.markAdopted();
            }).catch(function(err) {
                console.log(err.message);
            });
        });
    },

    markAdopted: function(adopters, account) {
        var adoptionInstance;

        App.contracts.Adoption.deployed().then(function(instance) {
            adoptionInstance = instance;

            return adoptionInstance.getAdopters.call();
        }).then(function(adopters) {
            for (i = 0; i < adopters.length; i++) {
                if (adopters[i] !== '0x0000000000000000000000000000000000000000') {
                    $('.panel-veggie').eq(i).find('button').text('Pending...').attr('disabled', true);
                }
            }
        }).catch(function(err) {
            console.log(err.message);
        });
    }

};

$(function() {
    $(window).load(function() {
        App.init();
    });
});
