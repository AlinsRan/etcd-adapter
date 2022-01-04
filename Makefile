# Copyright api7.ai
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

.PHONY: test
test:
	@go test ./...

.PHONY: bench
bench:
	@go test -bench '^Benchmark' ./...

.PHONY: gofmt
gofmt:
	@find . -name "*.go" | xargs gofmt -w

.PHONY: lint
lint:
	@golangci-lint run

.PHONY: build-apisix-mysql
build-apisix-mysql:
	@cd integrations/mysql && go build -o ../../apisix-mysql github.com/api7/etcd-adapter/integrations/mysql
