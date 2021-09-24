import { docs_v1 } from "googleapis";
import { mock, mockDeep } from "jest-mock-extended";
import { AuthenticatedClient } from "../../../../src/services/authenticated_client";
import { DocsAPI } from "../../../../src/services/google_apis/docs_api";

describe('DocsAPI', () => {
  test('has expected values', async () => {

    const mockClient = mock<AuthenticatedClient>();
    const docsMock = mockDeep<docs_v1.Docs>();

    (docsMock.documents.create as jest.Mock).mockResolvedValueOnce({data: 'hello'});
    
    const docsAPI = await DocsAPI.for('uid', mockClient, docsMock);

    const result = await docsAPI.createDoc('testy');
    
    expect(docsAPI.uid).toBe('uid');
    expect(result).toBe('hello');

  });
});
