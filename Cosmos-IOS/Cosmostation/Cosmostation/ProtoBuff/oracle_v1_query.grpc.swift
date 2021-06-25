//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: oracle/v1/query.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import GRPC
import NIO
import SwiftProtobuf


/// Query defines the gRPC querier service.
///
/// Usage: instantiate `Oracle_V1_QueryClient`, then call methods of this protocol to make API calls.
internal protocol Oracle_V1_QueryClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Oracle_V1_QueryClientInterceptorFactoryProtocol? { get }

  func counts(
    _ request: Oracle_V1_QueryCountsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Oracle_V1_QueryCountsRequest, Oracle_V1_QueryCountsResponse>

  func data(
    _ request: Oracle_V1_QueryDataRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Oracle_V1_QueryDataRequest, Oracle_V1_QueryDataResponse>

  func dataSource(
    _ request: Oracle_V1_QueryDataSourceRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Oracle_V1_QueryDataSourceRequest, Oracle_V1_QueryDataSourceResponse>

  func oracleScript(
    _ request: Oracle_V1_QueryOracleScriptRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Oracle_V1_QueryOracleScriptRequest, Oracle_V1_QueryOracleScriptResponse>

  func request(
    _ request: Oracle_V1_QueryRequestRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Oracle_V1_QueryRequestRequest, Oracle_V1_QueryRequestResponse>

  func pendingRequests(
    _ request: Oracle_V1_QueryPendingRequestsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Oracle_V1_QueryPendingRequestsRequest, Oracle_V1_QueryPendingRequestsResponse>

  func validator(
    _ request: Oracle_V1_QueryValidatorRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Oracle_V1_QueryValidatorRequest, Oracle_V1_QueryValidatorResponse>

  func reporters(
    _ request: Oracle_V1_QueryReportersRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Oracle_V1_QueryReportersRequest, Oracle_V1_QueryReportersResponse>

  func activeValidators(
    _ request: Oracle_V1_QueryActiveValidatorsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Oracle_V1_QueryActiveValidatorsRequest, Oracle_V1_QueryActiveValidatorsResponse>

  func params(
    _ request: Oracle_V1_QueryParamsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Oracle_V1_QueryParamsRequest, Oracle_V1_QueryParamsResponse>

  func requestSearch(
    _ request: Oracle_V1_QueryRequestSearchRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Oracle_V1_QueryRequestSearchRequest, Oracle_V1_QueryRequestSearchResponse>

  func requestPrice(
    _ request: Oracle_V1_QueryRequestPriceRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Oracle_V1_QueryRequestPriceRequest, Oracle_V1_QueryRequestPriceResponse>

  func requestVerification(
    _ request: Oracle_V1_QueryRequestVerificationRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Oracle_V1_QueryRequestVerificationRequest, Oracle_V1_QueryRequestVerificationResponse>

  func requestPool(
    _ request: Oracle_V1_QueryRequestPoolRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Oracle_V1_QueryRequestPoolRequest, Oracle_V1_QueryRequestPoolResponse>
}

extension Oracle_V1_QueryClientProtocol {
  internal var serviceName: String {
    return "oracle.v1.Query"
  }

  /// Counts queries the number of existing data sources, oracle scripts, and
  /// requests.
  ///
  /// - Parameters:
  ///   - request: Request to send to Counts.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func counts(
    _ request: Oracle_V1_QueryCountsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Oracle_V1_QueryCountsRequest, Oracle_V1_QueryCountsResponse> {
    return self.makeUnaryCall(
      path: "/oracle.v1.Query/Counts",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCountsInterceptors() ?? []
    )
  }

  /// Data queries content of the data source or oracle script for given SHA256
  /// file hash.
  ///
  /// - Parameters:
  ///   - request: Request to send to Data.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func data(
    _ request: Oracle_V1_QueryDataRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Oracle_V1_QueryDataRequest, Oracle_V1_QueryDataResponse> {
    return self.makeUnaryCall(
      path: "/oracle.v1.Query/Data",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDataInterceptors() ?? []
    )
  }

  /// DataSource queries data source summary info for given data source id.
  ///
  /// - Parameters:
  ///   - request: Request to send to DataSource.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func dataSource(
    _ request: Oracle_V1_QueryDataSourceRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Oracle_V1_QueryDataSourceRequest, Oracle_V1_QueryDataSourceResponse> {
    return self.makeUnaryCall(
      path: "/oracle.v1.Query/DataSource",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeDataSourceInterceptors() ?? []
    )
  }

  /// OracleScript queries oracle script summary info for given oracle script id.
  ///
  /// - Parameters:
  ///   - request: Request to send to OracleScript.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func oracleScript(
    _ request: Oracle_V1_QueryOracleScriptRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Oracle_V1_QueryOracleScriptRequest, Oracle_V1_QueryOracleScriptResponse> {
    return self.makeUnaryCall(
      path: "/oracle.v1.Query/OracleScript",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeOracleScriptInterceptors() ?? []
    )
  }

  /// Request queries request info for given request id.
  ///
  /// - Parameters:
  ///   - request: Request to send to Request.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func request(
    _ request: Oracle_V1_QueryRequestRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Oracle_V1_QueryRequestRequest, Oracle_V1_QueryRequestResponse> {
    return self.makeUnaryCall(
      path: "/oracle.v1.Query/Request",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeRequestInterceptors() ?? []
    )
  }

  /// PendingRequests queries list of pending request IDs assigned to given
  /// validator.
  ///
  /// - Parameters:
  ///   - request: Request to send to PendingRequests.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func pendingRequests(
    _ request: Oracle_V1_QueryPendingRequestsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Oracle_V1_QueryPendingRequestsRequest, Oracle_V1_QueryPendingRequestsResponse> {
    return self.makeUnaryCall(
      path: "/oracle.v1.Query/PendingRequests",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makePendingRequestsInterceptors() ?? []
    )
  }

  /// Validator queries properties of given validator address.
  ///
  /// - Parameters:
  ///   - request: Request to send to Validator.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func validator(
    _ request: Oracle_V1_QueryValidatorRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Oracle_V1_QueryValidatorRequest, Oracle_V1_QueryValidatorResponse> {
    return self.makeUnaryCall(
      path: "/oracle.v1.Query/Validator",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeValidatorInterceptors() ?? []
    )
  }

  /// Reporters queries all reporters associated with given validator address.
  ///
  /// - Parameters:
  ///   - request: Request to send to Reporters.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func reporters(
    _ request: Oracle_V1_QueryReportersRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Oracle_V1_QueryReportersRequest, Oracle_V1_QueryReportersResponse> {
    return self.makeUnaryCall(
      path: "/oracle.v1.Query/Reporters",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeReportersInterceptors() ?? []
    )
  }

  /// ActiveValidators queries all active oracle validators.
  ///
  /// - Parameters:
  ///   - request: Request to send to ActiveValidators.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func activeValidators(
    _ request: Oracle_V1_QueryActiveValidatorsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Oracle_V1_QueryActiveValidatorsRequest, Oracle_V1_QueryActiveValidatorsResponse> {
    return self.makeUnaryCall(
      path: "/oracle.v1.Query/ActiveValidators",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeActiveValidatorsInterceptors() ?? []
    )
  }

  /// Params queries parameters used for runnning bandchain network.
  ///
  /// - Parameters:
  ///   - request: Request to send to Params.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func params(
    _ request: Oracle_V1_QueryParamsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Oracle_V1_QueryParamsRequest, Oracle_V1_QueryParamsResponse> {
    return self.makeUnaryCall(
      path: "/oracle.v1.Query/Params",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeParamsInterceptors() ?? []
    )
  }

  /// RequestSearch queries the latest request that match search criteria.
  ///
  /// - Parameters:
  ///   - request: Request to send to RequestSearch.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func requestSearch(
    _ request: Oracle_V1_QueryRequestSearchRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Oracle_V1_QueryRequestSearchRequest, Oracle_V1_QueryRequestSearchResponse> {
    return self.makeUnaryCall(
      path: "/oracle.v1.Query/RequestSearch",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeRequestSearchInterceptors() ?? []
    )
  }

  /// RequestPrice queries the latest price on standard price reference oracle
  /// script.
  ///
  /// - Parameters:
  ///   - request: Request to send to RequestPrice.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func requestPrice(
    _ request: Oracle_V1_QueryRequestPriceRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Oracle_V1_QueryRequestPriceRequest, Oracle_V1_QueryRequestPriceResponse> {
    return self.makeUnaryCall(
      path: "/oracle.v1.Query/RequestPrice",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeRequestPriceInterceptors() ?? []
    )
  }

  /// RequestVerification verifies a request to make sure that
  /// all information that will be used to report the data is valid
  ///
  /// - Parameters:
  ///   - request: Request to send to RequestVerification.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func requestVerification(
    _ request: Oracle_V1_QueryRequestVerificationRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Oracle_V1_QueryRequestVerificationRequest, Oracle_V1_QueryRequestVerificationResponse> {
    return self.makeUnaryCall(
      path: "/oracle.v1.Query/RequestVerification",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeRequestVerificationInterceptors() ?? []
    )
  }

  /// RequestPool queries the request pool information corresponding to the given
  /// port, channel, and request key.
  ///
  /// - Parameters:
  ///   - request: Request to send to RequestPool.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func requestPool(
    _ request: Oracle_V1_QueryRequestPoolRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Oracle_V1_QueryRequestPoolRequest, Oracle_V1_QueryRequestPoolResponse> {
    return self.makeUnaryCall(
      path: "/oracle.v1.Query/RequestPool",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeRequestPoolInterceptors() ?? []
    )
  }
}

internal protocol Oracle_V1_QueryClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'counts'.
  func makeCountsInterceptors() -> [ClientInterceptor<Oracle_V1_QueryCountsRequest, Oracle_V1_QueryCountsResponse>]

  /// - Returns: Interceptors to use when invoking 'data'.
  func makeDataInterceptors() -> [ClientInterceptor<Oracle_V1_QueryDataRequest, Oracle_V1_QueryDataResponse>]

  /// - Returns: Interceptors to use when invoking 'dataSource'.
  func makeDataSourceInterceptors() -> [ClientInterceptor<Oracle_V1_QueryDataSourceRequest, Oracle_V1_QueryDataSourceResponse>]

  /// - Returns: Interceptors to use when invoking 'oracleScript'.
  func makeOracleScriptInterceptors() -> [ClientInterceptor<Oracle_V1_QueryOracleScriptRequest, Oracle_V1_QueryOracleScriptResponse>]

  /// - Returns: Interceptors to use when invoking 'request'.
  func makeRequestInterceptors() -> [ClientInterceptor<Oracle_V1_QueryRequestRequest, Oracle_V1_QueryRequestResponse>]

  /// - Returns: Interceptors to use when invoking 'pendingRequests'.
  func makePendingRequestsInterceptors() -> [ClientInterceptor<Oracle_V1_QueryPendingRequestsRequest, Oracle_V1_QueryPendingRequestsResponse>]

  /// - Returns: Interceptors to use when invoking 'validator'.
  func makeValidatorInterceptors() -> [ClientInterceptor<Oracle_V1_QueryValidatorRequest, Oracle_V1_QueryValidatorResponse>]

  /// - Returns: Interceptors to use when invoking 'reporters'.
  func makeReportersInterceptors() -> [ClientInterceptor<Oracle_V1_QueryReportersRequest, Oracle_V1_QueryReportersResponse>]

  /// - Returns: Interceptors to use when invoking 'activeValidators'.
  func makeActiveValidatorsInterceptors() -> [ClientInterceptor<Oracle_V1_QueryActiveValidatorsRequest, Oracle_V1_QueryActiveValidatorsResponse>]

  /// - Returns: Interceptors to use when invoking 'params'.
  func makeParamsInterceptors() -> [ClientInterceptor<Oracle_V1_QueryParamsRequest, Oracle_V1_QueryParamsResponse>]

  /// - Returns: Interceptors to use when invoking 'requestSearch'.
  func makeRequestSearchInterceptors() -> [ClientInterceptor<Oracle_V1_QueryRequestSearchRequest, Oracle_V1_QueryRequestSearchResponse>]

  /// - Returns: Interceptors to use when invoking 'requestPrice'.
  func makeRequestPriceInterceptors() -> [ClientInterceptor<Oracle_V1_QueryRequestPriceRequest, Oracle_V1_QueryRequestPriceResponse>]

  /// - Returns: Interceptors to use when invoking 'requestVerification'.
  func makeRequestVerificationInterceptors() -> [ClientInterceptor<Oracle_V1_QueryRequestVerificationRequest, Oracle_V1_QueryRequestVerificationResponse>]

  /// - Returns: Interceptors to use when invoking 'requestPool'.
  func makeRequestPoolInterceptors() -> [ClientInterceptor<Oracle_V1_QueryRequestPoolRequest, Oracle_V1_QueryRequestPoolResponse>]
}

internal final class Oracle_V1_QueryClient: Oracle_V1_QueryClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Oracle_V1_QueryClientInterceptorFactoryProtocol?

  /// Creates a client for the oracle.v1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Oracle_V1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Query defines the gRPC querier service.
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Oracle_V1_QueryProvider: CallHandlerProvider {
  var interceptors: Oracle_V1_QueryServerInterceptorFactoryProtocol? { get }

  /// Counts queries the number of existing data sources, oracle scripts, and
  /// requests.
  func counts(request: Oracle_V1_QueryCountsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Oracle_V1_QueryCountsResponse>

  /// Data queries content of the data source or oracle script for given SHA256
  /// file hash.
  func data(request: Oracle_V1_QueryDataRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Oracle_V1_QueryDataResponse>

  /// DataSource queries data source summary info for given data source id.
  func dataSource(request: Oracle_V1_QueryDataSourceRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Oracle_V1_QueryDataSourceResponse>

  /// OracleScript queries oracle script summary info for given oracle script id.
  func oracleScript(request: Oracle_V1_QueryOracleScriptRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Oracle_V1_QueryOracleScriptResponse>

  /// Request queries request info for given request id.
  func request(request: Oracle_V1_QueryRequestRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Oracle_V1_QueryRequestResponse>

  /// PendingRequests queries list of pending request IDs assigned to given
  /// validator.
  func pendingRequests(request: Oracle_V1_QueryPendingRequestsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Oracle_V1_QueryPendingRequestsResponse>

  /// Validator queries properties of given validator address.
  func validator(request: Oracle_V1_QueryValidatorRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Oracle_V1_QueryValidatorResponse>

  /// Reporters queries all reporters associated with given validator address.
  func reporters(request: Oracle_V1_QueryReportersRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Oracle_V1_QueryReportersResponse>

  /// ActiveValidators queries all active oracle validators.
  func activeValidators(request: Oracle_V1_QueryActiveValidatorsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Oracle_V1_QueryActiveValidatorsResponse>

  /// Params queries parameters used for runnning bandchain network.
  func params(request: Oracle_V1_QueryParamsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Oracle_V1_QueryParamsResponse>

  /// RequestSearch queries the latest request that match search criteria.
  func requestSearch(request: Oracle_V1_QueryRequestSearchRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Oracle_V1_QueryRequestSearchResponse>

  /// RequestPrice queries the latest price on standard price reference oracle
  /// script.
  func requestPrice(request: Oracle_V1_QueryRequestPriceRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Oracle_V1_QueryRequestPriceResponse>

  /// RequestVerification verifies a request to make sure that
  /// all information that will be used to report the data is valid
  func requestVerification(request: Oracle_V1_QueryRequestVerificationRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Oracle_V1_QueryRequestVerificationResponse>

  /// RequestPool queries the request pool information corresponding to the given
  /// port, channel, and request key.
  func requestPool(request: Oracle_V1_QueryRequestPoolRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Oracle_V1_QueryRequestPoolResponse>
}

extension Oracle_V1_QueryProvider {
  internal var serviceName: Substring { return "oracle.v1.Query" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Counts":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Oracle_V1_QueryCountsRequest>(),
        responseSerializer: ProtobufSerializer<Oracle_V1_QueryCountsResponse>(),
        interceptors: self.interceptors?.makeCountsInterceptors() ?? [],
        userFunction: self.counts(request:context:)
      )

    case "Data":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Oracle_V1_QueryDataRequest>(),
        responseSerializer: ProtobufSerializer<Oracle_V1_QueryDataResponse>(),
        interceptors: self.interceptors?.makeDataInterceptors() ?? [],
        userFunction: self.data(request:context:)
      )

    case "DataSource":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Oracle_V1_QueryDataSourceRequest>(),
        responseSerializer: ProtobufSerializer<Oracle_V1_QueryDataSourceResponse>(),
        interceptors: self.interceptors?.makeDataSourceInterceptors() ?? [],
        userFunction: self.dataSource(request:context:)
      )

    case "OracleScript":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Oracle_V1_QueryOracleScriptRequest>(),
        responseSerializer: ProtobufSerializer<Oracle_V1_QueryOracleScriptResponse>(),
        interceptors: self.interceptors?.makeOracleScriptInterceptors() ?? [],
        userFunction: self.oracleScript(request:context:)
      )

    case "Request":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Oracle_V1_QueryRequestRequest>(),
        responseSerializer: ProtobufSerializer<Oracle_V1_QueryRequestResponse>(),
        interceptors: self.interceptors?.makeRequestInterceptors() ?? [],
        userFunction: self.request(request:context:)
      )

    case "PendingRequests":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Oracle_V1_QueryPendingRequestsRequest>(),
        responseSerializer: ProtobufSerializer<Oracle_V1_QueryPendingRequestsResponse>(),
        interceptors: self.interceptors?.makePendingRequestsInterceptors() ?? [],
        userFunction: self.pendingRequests(request:context:)
      )

    case "Validator":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Oracle_V1_QueryValidatorRequest>(),
        responseSerializer: ProtobufSerializer<Oracle_V1_QueryValidatorResponse>(),
        interceptors: self.interceptors?.makeValidatorInterceptors() ?? [],
        userFunction: self.validator(request:context:)
      )

    case "Reporters":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Oracle_V1_QueryReportersRequest>(),
        responseSerializer: ProtobufSerializer<Oracle_V1_QueryReportersResponse>(),
        interceptors: self.interceptors?.makeReportersInterceptors() ?? [],
        userFunction: self.reporters(request:context:)
      )

    case "ActiveValidators":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Oracle_V1_QueryActiveValidatorsRequest>(),
        responseSerializer: ProtobufSerializer<Oracle_V1_QueryActiveValidatorsResponse>(),
        interceptors: self.interceptors?.makeActiveValidatorsInterceptors() ?? [],
        userFunction: self.activeValidators(request:context:)
      )

    case "Params":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Oracle_V1_QueryParamsRequest>(),
        responseSerializer: ProtobufSerializer<Oracle_V1_QueryParamsResponse>(),
        interceptors: self.interceptors?.makeParamsInterceptors() ?? [],
        userFunction: self.params(request:context:)
      )

    case "RequestSearch":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Oracle_V1_QueryRequestSearchRequest>(),
        responseSerializer: ProtobufSerializer<Oracle_V1_QueryRequestSearchResponse>(),
        interceptors: self.interceptors?.makeRequestSearchInterceptors() ?? [],
        userFunction: self.requestSearch(request:context:)
      )

    case "RequestPrice":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Oracle_V1_QueryRequestPriceRequest>(),
        responseSerializer: ProtobufSerializer<Oracle_V1_QueryRequestPriceResponse>(),
        interceptors: self.interceptors?.makeRequestPriceInterceptors() ?? [],
        userFunction: self.requestPrice(request:context:)
      )

    case "RequestVerification":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Oracle_V1_QueryRequestVerificationRequest>(),
        responseSerializer: ProtobufSerializer<Oracle_V1_QueryRequestVerificationResponse>(),
        interceptors: self.interceptors?.makeRequestVerificationInterceptors() ?? [],
        userFunction: self.requestVerification(request:context:)
      )

    case "RequestPool":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Oracle_V1_QueryRequestPoolRequest>(),
        responseSerializer: ProtobufSerializer<Oracle_V1_QueryRequestPoolResponse>(),
        interceptors: self.interceptors?.makeRequestPoolInterceptors() ?? [],
        userFunction: self.requestPool(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Oracle_V1_QueryServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'counts'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeCountsInterceptors() -> [ServerInterceptor<Oracle_V1_QueryCountsRequest, Oracle_V1_QueryCountsResponse>]

  /// - Returns: Interceptors to use when handling 'data'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeDataInterceptors() -> [ServerInterceptor<Oracle_V1_QueryDataRequest, Oracle_V1_QueryDataResponse>]

  /// - Returns: Interceptors to use when handling 'dataSource'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeDataSourceInterceptors() -> [ServerInterceptor<Oracle_V1_QueryDataSourceRequest, Oracle_V1_QueryDataSourceResponse>]

  /// - Returns: Interceptors to use when handling 'oracleScript'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeOracleScriptInterceptors() -> [ServerInterceptor<Oracle_V1_QueryOracleScriptRequest, Oracle_V1_QueryOracleScriptResponse>]

  /// - Returns: Interceptors to use when handling 'request'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeRequestInterceptors() -> [ServerInterceptor<Oracle_V1_QueryRequestRequest, Oracle_V1_QueryRequestResponse>]

  /// - Returns: Interceptors to use when handling 'pendingRequests'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makePendingRequestsInterceptors() -> [ServerInterceptor<Oracle_V1_QueryPendingRequestsRequest, Oracle_V1_QueryPendingRequestsResponse>]

  /// - Returns: Interceptors to use when handling 'validator'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeValidatorInterceptors() -> [ServerInterceptor<Oracle_V1_QueryValidatorRequest, Oracle_V1_QueryValidatorResponse>]

  /// - Returns: Interceptors to use when handling 'reporters'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeReportersInterceptors() -> [ServerInterceptor<Oracle_V1_QueryReportersRequest, Oracle_V1_QueryReportersResponse>]

  /// - Returns: Interceptors to use when handling 'activeValidators'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeActiveValidatorsInterceptors() -> [ServerInterceptor<Oracle_V1_QueryActiveValidatorsRequest, Oracle_V1_QueryActiveValidatorsResponse>]

  /// - Returns: Interceptors to use when handling 'params'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeParamsInterceptors() -> [ServerInterceptor<Oracle_V1_QueryParamsRequest, Oracle_V1_QueryParamsResponse>]

  /// - Returns: Interceptors to use when handling 'requestSearch'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeRequestSearchInterceptors() -> [ServerInterceptor<Oracle_V1_QueryRequestSearchRequest, Oracle_V1_QueryRequestSearchResponse>]

  /// - Returns: Interceptors to use when handling 'requestPrice'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeRequestPriceInterceptors() -> [ServerInterceptor<Oracle_V1_QueryRequestPriceRequest, Oracle_V1_QueryRequestPriceResponse>]

  /// - Returns: Interceptors to use when handling 'requestVerification'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeRequestVerificationInterceptors() -> [ServerInterceptor<Oracle_V1_QueryRequestVerificationRequest, Oracle_V1_QueryRequestVerificationResponse>]

  /// - Returns: Interceptors to use when handling 'requestPool'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeRequestPoolInterceptors() -> [ServerInterceptor<Oracle_V1_QueryRequestPoolRequest, Oracle_V1_QueryRequestPoolResponse>]
}