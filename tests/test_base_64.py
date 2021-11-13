import pytest
from brownie import network, accounts, exceptions


class TestBase64():

    @pytest.fixture()
    def contract(self):
        if network.show_active() not in ["development", "dev"] or "fork" in network.show_active():
            pytest.skip("Only for local testing")
        output = None
        return output

    def test_add(contract):
        assert 1 == 1